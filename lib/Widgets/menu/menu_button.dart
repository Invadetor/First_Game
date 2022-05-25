
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giocomattia/gioco_mattia.dart';

class MenuButton extends StatefulWidget {

  final GiocoMattia g;
  MenuButton(this.g, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MenuButtonState();

}

class MenuButtonState extends State<MenuButton>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextButton(
      onPressed: () {widget.g.pauseEngine(); widget.g.paused = true;},
      child: const Icon(
        Icons.pause_circle_filled,
        size: 80,
        color: Colors.white,
      ),
    );
  }

}