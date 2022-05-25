import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:giocomattia/components/enemy.dart';
import 'package:giocomattia/components/worldcollidable.dart';
import 'package:giocomattia/gioco_mattia.dart';
import 'package:giocomattia/scenemanager.dart';
import '../helpers/direction.dart';
import 'package:flame/sprite.dart';

class Player extends SpriteAnimationComponent with HasGameRef, CollisionCallbacks { ///Protocollo Mixin


  Direction direction = Direction.none;

  late ShapeHitbox hitbox;

  int level = 1;
  int totalHP = 200;
  int currentHP = 200;
  int totalMP = 100;
  int currentMP = 100;
  int att_fis = 20;
  int dif_fis = 15;
  int att_mag = 10;
  int dif_mag = 15;
  int agil = 20;
  int vel = 20;


  late final SpriteAnimation runup;
  late final SpriteAnimation rundown;
  late final SpriteAnimation runleft;
  late final SpriteAnimation runright;
  late SpriteAnimation stand;
  late final SpriteAnimation standUp;
  late final SpriteAnimation standDown;
  late final SpriteAnimation standLeft;
  late final SpriteAnimation standRight;
  final double _animationSpeed = 0.15;
  SpriteSheet? spriteSheet;
  Direction _collisionDirection = Direction.none;
  bool _hasCollided = false;

  final double _playerSpeed = 300.0;

  bool startBattle = false;

  Player(): super(size: Vector2.all(50)) {
    add(RectangleHitbox());
  }

  @override
  void onCollision(Set<Vector2> points, PositionComponent other) {
    // TODO: implement collidingWith
    super.onCollision(points, other);
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollisionStart
    super.onCollisionStart(intersectionPoints, other);
    if (other is WorldCollidable) {
      _hasCollided = true;
      _collisionDirection = direction;
    }
    if(other is Enemy) {
      _hasCollided = true;
      SceneManager().loadFightScene(this, other);
    }
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    // TODO: implement onCollisionEnd
    ///Quello che succede quando le collisioni terminano
    _hasCollided = false;
    super.onCollisionEnd(other);
  }



  @override
  Future<void>? onLoad() async { ///? = Null safety
    super.onLoad();
    hitbox = RectangleHitbox();
    add(hitbox);
    position = gameRef.size/2;
    _loadAnimations().then( (_) => animation = stand );

  }

  @override
  void update(double dt) { ///dt = Il lasso di tempo passato dall'ultima chiamata
    super.update(dt);
    MovePlayer(dt);

   /* if (spriteSheet != null) {
      //Cambiare il valore di stand in base alla direzione
      switch(direction) {
        case Direction.up:
          stand = spriteSheet!.createAnimation(row: 2, stepTime: _animationSpeed, to:1);
          break;
        case Direction.down:
          stand = spriteSheet!.createAnimation(row: 0, stepTime: _animationSpeed, to:1);
          break;
        case Direction.left:
          stand = spriteSheet!.createAnimation(row: 1, stepTime: _animationSpeed, to:1);
          break;
        case Direction.right:
          stand = spriteSheet!.createAnimation(row: 3, stepTime: _animationSpeed, to:1);
          break;
      }
    }*/
  }

  Future<void> _loadAnimations () async {
    spriteSheet = SpriteSheet(image: await gameRef.images.load('player_spritesheet.png'), srcSize: Vector2(29, 32));
    runup = spriteSheet!.createAnimation(row: 2, stepTime: _animationSpeed, to:4);
    rundown = spriteSheet!.createAnimation(row: 0, stepTime: _animationSpeed, to:4);
    runleft = spriteSheet!.createAnimation(row: 1, stepTime: _animationSpeed, to:4);
    runright = spriteSheet!.createAnimation(row: 3, stepTime: _animationSpeed, to:4);

    standUp = spriteSheet!.createAnimation(row: 2, stepTime: _animationSpeed, to:1);
    standDown = spriteSheet!.createAnimation(row: 0, stepTime: _animationSpeed, to:1);
    standLeft = spriteSheet!.createAnimation(row: 1, stepTime: _animationSpeed, to:1);
    standRight = spriteSheet!.createAnimation(row: 3, stepTime: _animationSpeed, to:1);
    stand = standDown;
  }



  void MovePlayer(double dx /*Quantità di spostamento*/) {

    switch(direction) {
      case Direction.up:
        if(canPlayerMoveUp()) {
          stand = standUp;
          animation = runup;
          moveUp(dx);
        }
        break;
      case Direction.down:
        if(canPlayerMoveDown()) {
          stand =standDown;
          animation = rundown;
          moveDown(dx);
        }
        break;
      case Direction.left:
        if(canPlayerMoveLeft()) {
          stand = standLeft;
          animation = runleft;
          moveLeft(dx);
        }
        break;
      case Direction.right:
        if(canPlayerMoveRight()) {
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

  void moveDown(double dx) {
      position.add(Vector2(0, dx*_playerSpeed));
  }

  void moveUp(double dx) {
      position.sub(Vector2(0, dx*_playerSpeed));
  }

  void moveLeft(double dx) {
      position.sub(Vector2(dx*_playerSpeed, 0));
  }

  void moveRight(double dx) {
      position.add(Vector2(dx*_playerSpeed, 0));
  }

  bool canPlayerMoveUp() {
    if (_hasCollided && (_collisionDirection == Direction.up || _collisionDirection == Direction.none)){
      return false;
    }
    return true;
  }

  bool canPlayerMoveDown() {
    if (_hasCollided && (_collisionDirection == Direction.down || _collisionDirection == Direction.none)){
      return false;
    }
    return true;
  }

  bool canPlayerMoveLeft() {
    if (_hasCollided && (_collisionDirection == Direction.left || _collisionDirection == Direction.none)){
      return false;
    }
    return true;
  }

  bool canPlayerMoveRight() {
    if (_hasCollided && (_collisionDirection == Direction.right || _collisionDirection == Direction.none)){
      return false;
    }
    return true;
  }

}