import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColonnaMenu extends StatelessWidget {

  const ColonnaMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: TextButton(
            onPressed: () {},
            child: const Text(
              "Opzioni",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: TextButton(
            onPressed: () {},
            child: const Text(
              "Equipaggiamento",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: TextButton(
            onPressed: () {},
            child: const Text(
              "Oggetti",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: TextButton(
            onPressed: () {},
            child: const Text(
              "Statistiche",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: TextButton(
            onPressed: () {},
            child: const Text(
              "Salva",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: TextButton(
            onPressed: () {},
            child: const Text(
              "Carica",
            ),
          ),
        ),
      ],
    );
  }

}