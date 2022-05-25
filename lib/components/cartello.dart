import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:giocomattia/components/dialoguebox.dart';
import 'package:giocomattia/components/player.dart';
import 'package:giocomattia/gioco_mattia.dart';

import 'mytextbox.dart';

class Cartello extends SpriteComponent with HasGameRef, CollisionCallbacks {

  late DialogueBox d;
  late ShapeHitbox h;

  Cartello(this.d) : super(size: Vector2(60, 60)) {}


  @override
  Future<void>? onLoad() async {
    // TODO: implement onLoad
    sprite = await gameRef.loadSprite('58ddcb0c1d37285.png');
    position = Vector2(gameRef.size.x - 50, gameRef.size.y - 80);
    h = RectangleHitbox();
    add(h);

    return super.onLoad();
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollisionStart
    super.onCollisionStart(intersectionPoints, other);
    if(other is Player) {
      bool _hasCollided = true;
      d.show("Ciao");
    }
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    // TODO: implement onCollisionEnd
    bool _hasCollided = false;
    super.onCollisionEnd(other);
  }
}