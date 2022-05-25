import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flutter/cupertino.dart';

class MyTextBox extends TextBoxComponent {

  MyTextBox(String s) : super(text: s, textRenderer: TextPaint(style: TextStyle(color: BasicPalette.black.color)), boxConfig: TextBoxConfig(timePerChar: 0.3));

  @override
  void drawBackground(Canvas c) {
    // TODO: implement drawBackground
    Rect r = Rect.fromLTWH(0, 0, width, height);
    Paint p = Paint();
    p.color = BasicPalette.black.color;
    p.style = PaintingStyle.stroke;
    c.drawRect(r.deflate(boxConfig.margins.horizontal), p);

    super.drawBackground(c);
  }

}