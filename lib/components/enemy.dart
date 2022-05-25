import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/sprite.dart';
import 'package:giocomattia/components/worldcollidable.dart';
import 'dart:math';
import '../helpers/direction.dart';

class Enemy extends SpriteAnimationComponent with HasGameRef, CollisionCallbacks {

  late SpriteAnimation stand;
  int level;
  int totalHP;
  int currentHP;
  int totalMP;
  int currentMP;
  int att_fis;
  int dif_fis;
  int att_mag;
  int dif_mag;
  int agil;
  int vel;

  Enemy( {
    required this.level,
    required this.totalHP ,
    required this.currentHP,
    required this.totalMP,
    required this.currentMP,
    required this.att_fis,
    required this.dif_fis,
    required this.att_mag,
    required this.dif_mag,
    required this.agil,
    required this.vel,
  } ) : super(size: Vector2(42, 60)) {}

}

class Skeleton extends Enemy {

  Direction direction = Direction.none;
  late final SpriteAnimation runup;
  late final SpriteAnimation rundown;
  late final SpriteAnimation runleft;
  late final SpriteAnimation runright;
  late final SpriteAnimation standUp;
  late final SpriteAnimation standDown;
  late final SpriteAnimation standLeft;
  late final SpriteAnimation standRight;
  final double _animationSpeed = 0.15;
  final double _skelSpeed = 50.0;
  SpriteSheet? spriteSheet;
  late ShapeHitbox hitbox;
  Direction _collisionDirection = Direction.none;
  bool _hasCollided = false;

  double t = 0;
  int standTime = 0;

  Skeleton (int level, int totalHP, int currentHP, int totalMP, int currentMP, int att_fis, int dif_fis, int att_mag, int dif_mag, int agil, int vel)
      : super(level:level, totalHP:totalHP, currentHP:currentHP, totalMP:totalMP, currentMP:currentMP, att_fis:att_fis, dif_fis:dif_fis, dif_mag:dif_mag, att_mag:att_mag, vel:vel, agil:agil) {}


  @override ///Cosa fa questa funzione? Non è la stessa cosa di "onCollisionStart"?
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollision
    super.onCollision(intersectionPoints, other);
  }

  ///Non posso mettere queste due funzioni nella classe "Enemies" apposto di "Skeleton", visto che tutti i nemici devono avere queste collisioni?
  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollisionStart
    super.onCollisionStart(intersectionPoints, other);
    if (other is WorldCollidable) {
      _hasCollided = true;
      _collisionDirection = direction;
    }
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    // TODO: implement onCollisionEnd
    _hasCollided = false;
    super.onCollisionEnd(other);
  }

  @override
  Future<void>? onLoad() {
    // TODO: implement onLoad
    super.onLoad();
    hitbox = RectangleHitbox();
    add(hitbox);
    position = Vector2(gameRef.size.x - 30, gameRef.size.y - 60);
    _loadAnimations().then( (_) => animation = stand );

  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    t += dt;
    if (t >= 5) {
        casualDirection();
        standTime++;
        t = 0;
        if(standTime == 3) {
          direction = Direction.none;
          standTime = 0;
        }
    }
    MoveSkeleton(dt);
  }

  Future<void> _loadAnimations () async {
    spriteSheet = SpriteSheet(image: await gameRef.images.load('enemies/undeadadventurer01.png'), srcSize: Vector2(32, 48));
    runup = spriteSheet!.createAnimation(row: 3, stepTime: _animationSpeed, to:4);
    rundown = spriteSheet!.createAnimation(row: 0, stepTime: _animationSpeed, to:4);
    runleft = spriteSheet!.createAnimation(row: 1, stepTime: _animationSpeed, to:4);
    runright = spriteSheet!.createAnimation(row: 2, stepTime: _animationSpeed, to:4);
    standUp = spriteSheet!.createAnimation(row: 3, stepTime: _animationSpeed, to:1);
    standDown = spriteSheet!.createAnimation(row: 0, stepTime: _animationSpeed, to:1);
    standLeft = spriteSheet!.createAnimation(row: 1, stepTime: _animationSpeed, to:1);
    standRight = spriteSheet!.createAnimation(row: 2, stepTime: _animationSpeed, to:1);
    stand = standDown;
  }



  void MoveSkeleton(double dx) {

    switch(direction) {
      case Direction.up:
          if(canSkelMoveUp()) {
            stand = standUp;
            animation = runup;
            moveUp(dx);
          }
        break;
      case Direction.down:
        if(canSkelMoveDown()) {
          stand =standDown;
          animation = rundown;
          moveDown(dx);
        }
        break;
      case Direction.left:
          if(canSkelMoveLeft()) {
            stand = standLeft;
            animation = runleft;
            moveLeft(dx);
          }
        break;
      case Direction.right:
        if(canSkelMoveRight()) {
          stand = standRight;
          animation = runright;
          moveRight(dx);
        }
        break;
      case Direction.none:
        animation = stand;
        break;
    }
  }

  void casualDirection() {
    Random random = Random();
    int rn = random.nextInt(Direction.values.length);
    direction = Direction.values[rn];
  }

  void moveDown(double dx) {
    position.add(Vector2(0, dx*_skelSpeed));
  }

  void moveUp(double dx) {
    position.sub(Vector2(0, dx*_skelSpeed));
  }

  void moveLeft(double dx) {
    position.sub(Vector2(dx*_skelSpeed, 0));
  }

  void moveRight(double dx) {
    position.add(Vector2(dx*_skelSpeed, 0));
  }

  bool canSkelMoveUp() {
    if (_hasCollided && (_collisionDirection == Direction.up || _collisionDirection == Direction.none)){
      return false;
    }
    return true;
  }

  bool canSkelMoveDown() {
    if (_hasCollided && (_collisionDirection == Direction.down || _collisionDirection == Direction.none)){
      return false;
    }
    return true;
  }

  bool canSkelMoveLeft() {
    if (_hasCollided && (_collisionDirection == Direction.left || _collisionDirection == Direction.none)){
      return false;
    }
    return true;
  }

  bool canSkelMoveRight() {
    if (_hasCollided && (_collisionDirection == Direction.right || _collisionDirection == Direction.none)){
      return false;
    }
    return true;
  }

  /* bool skelBoundries() {
    Rect r = Rect.fromLTRB(gameRef.size.x - 50, gameRef.size.y - 90, gameRef.size.x - 20, gameRef.size.y - 40);
    if(this.position.x > r.left && this.position.x < r.right && this.position.y > r.top && this.position.y < r.bottom) {
      return true;
    }
    return false;
  } */

}
