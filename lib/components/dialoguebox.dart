import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:giocomattia/components/mytextbox.dart';
import 'package:giocomattia/components/player.dart';

class DialogueBox extends SpriteComponent with HasGameRef, CollisionCallbacks {

  late TextBoxComponent text;
  late ShapeHitbox hitbox;
  bool _hasCollided = false;

  @override
  Future<void>? onLoad() async {
    // TODO: implement onLoad
    sprite = await gameRef.loadSprite('png-transparent-dialog-box-video-game-dialogue-game-box-game-angle-rectangle.png');
    size = Vector2(gameRef.size.x -20, gameRef.size.y/4);
    position = Vector2(30, -50);

    return super.onLoad();
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollisionStart
    super.onCollisionStart(intersectionPoints, other);
    if(other is Player) {
      bool _hasCollided = true;
      add(MyTextBox("Ciao"));
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollision
    super.onCollision(intersectionPoints, other);
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    // TODO: implement onCollisionEnd
    bool _hasCollided = false;
    super.onCollisionEnd(other);
  }

  ///Rect.fromLTWH(20, (gameRef.size.height/4) * 3, gameRef.size.widht -20, gameRef.size.height/4)

}