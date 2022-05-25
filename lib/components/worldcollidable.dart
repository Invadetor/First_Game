import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/geometry.dart';
import 'package:flame/collisions.dart';

class WorldCollidable extends PositionComponent with HasGameRef, CollisionCallbacks {

  late ShapeHitbox hitbox;

  @override
  Future<void>? onLoad() {
    // TODO: implement onLoad
    hitbox = RectangleHitbox();
    add(hitbox);
    return super.onLoad();
  }
}