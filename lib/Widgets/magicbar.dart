import 'package:flutter/material.dart';

import '../gioco_mattia.dart';
import 'package:flutter/cupertino.dart';
import 'package:giocomattia/gioco_mattia.dart';


class Magicbar extends StatefulWidget {
  Rect? barRect;
  Rect? remainingRect;
  final GiocoMattia g;

  Magicbar (this.g, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MagicBarState();
}

class MagicBarState extends State<Magicbar> {

  double? percentageMP;
  double? barWidth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    percentageMP = widget.g.player.currentMP / widget.g.player.totalMP;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    barWidth = MediaQuery.of(context).size.width/5;
    return Container (
      width: barWidth,
      height: 8,
      decoration: const BoxDecoration (
        shape: BoxShape.rectangle,
        color: Colors.black
      ),
      child: Container (
        width: (barWidth != null && percentageMP != null) ? barWidth! * percentageMP! : 0,
        height: 8,
        decoration: const BoxDecoration (
          shape: BoxShape.rectangle,
          color: Colors.blue
        ),
      )
    );
  }

}