

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SchedaGiocatore extends StatelessWidget{

  const SchedaGiocatore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Container(color: Colors.black26,),
            flex: 4,
          ),
          Expanded(
            child: Container(
              child: Column(
                children: const [
                  Text("Health Points"),
                  Text("Magic Points"),
                  Text("Physical Attack"),
                  Text("Physical Defense"),
                  Text("Magical Attack"),
                  Text("Magical Defense"),
                  Text("Agility"),
                  Text("Speed"),
                ]
              ),
            ),
            flex: 6,
          ),
        ],
      )
    );
  }

}