import 'dart:ui';
import 'package:giocomattia/gioco_mattia.dart';
import 'components/enemy.dart';
import 'components/player.dart';

class SceneManager {
  GiocoMattia? g;
  static final _instance = SceneManager._private();

  SceneManager._private();
  factory SceneManager() {
    return _instance;
  }

  void loadFightScene(Player p, Enemy e) {
    g?.loadFigthScene(p, e);
  }

  void loadMainMap() {
    g?.loadMainMap();
  }

}