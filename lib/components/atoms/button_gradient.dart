import 'package:flutter/material.dart';

class ButtonGradient extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback onPressed;
  final String text;
  final BuildContext context;
  double fontSize;

  ButtonGradient.large({this.onPressed, this.text = "", this.fontSize = 16.0})
      : width = double.infinity,
        height = 50.0;

  ButtonGradient.small({this.onPressed, this.text})
      : height = 38.0,
        fontSize = 14.0,
        width = 120.0;

  ButtonGradient(
      {this.height,
      this.width,
      this.text,
      this.onPressed,
      this.context,
      this.fontSize = 16.0});

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: onPressed,
      child: new Container(
        width: width,
        height: height,
        child: new Center(
          child: new Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Text(
              text,
              style: new TextStyle(color: Colors.white, fontSize: fontSize),
            ),
          ),
        ),
        decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(5.0),
            //border: new Border.all(color: Colors.red,width: 2.0),
            gradient: new LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.red[500], Colors.orange[600]],
              tileMode: TileMode.repeated,
            )),
      ),
    );
  }
}
