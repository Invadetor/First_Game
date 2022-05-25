
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giocomattia/Widgets/menu/colonnamenu.dart';
import 'package:giocomattia/Widgets/menu/cubo_statistiche.dart';
import 'package:giocomattia/gioco_mattia.dart';

class MenuDiGioco extends StatelessWidget{

  final GiocoMattia g;
  MenuDiGioco(this.g, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {g.resumeEngine();},
          child: const Icon(
            Icons.play_circle_fill,
            size: 80,
            color: Colors.white,
          )
        ),
        Row(
          children: const [
            Expanded(child: ColonnaMenu(), flex: 3,),
            Expanded(child: CuboStatistiche(), flex: 7,),
          ],
        ),
      ],
    );
  }
}