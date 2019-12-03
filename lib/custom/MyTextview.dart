import 'package:flutter/material.dart';

class MyTextview extends StatelessWidget {
  String title;
  Color color;
  double fontSize;
  String fontName;

  MyTextview(this.title,{this.color = Colors.white,this.fontSize = 14,this.fontName});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: fontName,
      ),
    );
  }
}
