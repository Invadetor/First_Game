/** Copyright (c) 2021 Razeware LLC

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
distribute, sublicense, create a derivative work, and/or sell copies of the
Software in any work that is designed, intended, or marketed for pedagogical or
instructional purposes related to programming, coding, application development,
or information technology.  Permission for such use, copying, modification,
merger, publication, distribution, sublicensing, creation of derivative works,
or sale is expressly withheld.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE. **/

import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:giocomattia/Widgets/healthbar.dart';
import 'package:giocomattia/Widgets/menu/menu_button.dart';
import 'package:giocomattia/Widgets/menu/menudigioco.dart';
import 'package:giocomattia/gioco_mattia.dart';
import 'package:giocomattia/scenemanager.dart';
import 'Widgets/magicbar.dart';
import 'helpers/direction.dart';
import 'Widgets/joypad.dart';

class MainGamePage extends StatefulWidget {
  const MainGamePage({Key? key}) : super(key: key);

  @override
  MainGameState createState() => MainGameState();
}

class MainGameState extends State<MainGamePage> {
  GiocoMattia g = GiocoMattia();
  SceneManager s = SceneManager();
  @override
  Widget build(BuildContext context) {
    s.g = g;
    return Scaffold(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 1.0),
        body: Stack(
          children: [
            GameWidget(game: g),

            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Joypad(onDirectionChanged: onJoypadDirectionChanged),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top:32),
                child: MenuButton(g),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Healthbar(g)
              )
            ),
            ///Non sono sicuro se funziona, e non so nemmeno se è "Linkato" alla barra della vita.
            Align(
              alignment: Alignment.topRight,
              child: Padding (
                  padding: const EdgeInsets.only(right: 32, top: 45),
                  child: Magicbar(g)
              ),
            ),
            if(g.paused)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(50),
                  child: MenuDiGioco(g),
                )
              )
          ],
        ));
  }

  void onJoypadDirectionChanged(Direction direction) {
    g.onJoypadDirectionChange(direction);
  }
}