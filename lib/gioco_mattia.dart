import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:giocomattia/Widgets/healthbar.dart';
import 'package:giocomattia/components/fightscene.dart';
import 'package:giocomattia/components/mytextbox.dart';
import 'components/enemy.dart';
import 'components/player.dart';
import '../helpers/direction.dart';
import 'components/mappa.dart';
import 'dart:ui';

import 'components/worldcollidable.dart';
import 'helpers/map_loader.dart';

class GiocoMattia extends FlameGame with HasCollisionDetection {

  final Player player = Player();
  final Mappa _mappa = Mappa();
  final FightScene _fightscene = FightScene();
  final Skeleton _skeleton = Skeleton(5, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11);


  @override
  Future<void>? onLoad() {
    // TODO: implement onLoad
    loadMainMap();

    return super.onLoad();
  }

  void addWorldCollision() async {
    (await MapLoader.readRayWorldCollisionMap()).forEach((element) {
      var collidable = WorldCollidable();
      collidable.position = Vector2(element.left, element.top);
      collidable.width = element.width;
      collidable.height = element.height;
      add(collidable);
      /*add( WorldCollidable()
          ..position = Vector2(element.left, element.top)
          ..width = element.width
          ..height = element.height
      );*/
    });
  }

  void onJoypadDirectionChange(Direction d) {
    ///Quello che accade quando il Joypad viene mosso verso la direzione d (Direction d)
    player.direction = d;
  }

  void loadMainMap() {
    add(_mappa);
    ///Serve per dove la camera deve seguire, se togliamo l'acqua il personaggio continuà a caminare mentre la camera no
    _mappa.onLoad()?.then((value) => camera.worldBounds = Rect.fromLTWH(0, 0, _mappa.size.x, _mappa.size.y));
    add(player);
    add(_skeleton);
    add(MyTextBox("Ciao"));
    addWorldCollision();

    camera.followComponent(player);
  }

  void loadFigthScene(Player p, Enemy e) {
    remove(_mappa);

    add(_fightscene);
  }
}