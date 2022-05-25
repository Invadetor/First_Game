import 'package:flame/components.dart';

class FightScene extends SpriteComponent with HasGameRef {


  @override
  Future<void>? onLoad() async {
    sprite = await gameRef.loadSprite('FightBG.png');
    size = sprite!.originalSize;

    return super.onLoad();
  }

}