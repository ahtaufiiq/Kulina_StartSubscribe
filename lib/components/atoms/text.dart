import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  var font = FontWeight.bold;
  var fontSize = 14.0;

  CustomText.medium({this.text})
      : fontSize = 14.0,
        font = FontWeight.normal;

  CustomText.title_medium({this.text}) : fontSize = 12.0;

  CustomText.title({this.text}) : fontSize = 16.0;

  CustomText({this.text});

  @override
  Widget build(BuildContext context) {
    return new Text(text,
        style: new TextStyle(fontSize: fontSize, fontWeight: font));
  }
}
