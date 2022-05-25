import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:giocomattia/components/mytextbox.dart';
import 'package:giocomattia/components/player.dart';

class DialogueBox extends SpriteComponent with HasGameRef, CollisionCallbacks {

  late MyTextBox text;

  @override
  Future<void>? onLoad() async {
    // TODO: implement onLoad
    sprite = await gameRef.loadSprite('png-transparent-dialog-box-video-game-dialogue-game-box-game-angle-rectangle.png');
    size = Vector2(gameRef.size.x -20, gameRef.size.y/4);
    position = Vector2(30, -50);

    return super.onLoad();
  }

  void show (String s) {
    text = MyTextBox(s);
    add(text);
  }

  ///Rect.fromLTWH(20, (gameRef.size.height/4) * 3, gameRef.size.widht -20, gameRef.size.height/4)

}