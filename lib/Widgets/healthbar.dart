import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../gioco_mattia.dart';

class Healthbar extends StatefulWidget {

  Rect? barRect;
  Rect? remainingRect;
  final GiocoMattia g;

  Healthbar(this.g, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HealthBarState();
}

class HealthBarState extends State<Healthbar> {

  double? percentageHP;
  double? barWidth;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    percentageHP =  widget.g.player.currentHP / widget.g.player.totalHP;
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    barWidth = MediaQuery.of(context).size.width/5;
    return Container(
      width: barWidth,
      height: 10,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.black
      ),
      child: Container(
        width: (barWidth != null && percentageHP != null) ? barWidth! * percentageHP!: 0,
        height: 10,
        decoration: const BoxDecoration(
          shape:BoxShape.rectangle,
          color: Colors.green
        ),
      )
    );
  }

}