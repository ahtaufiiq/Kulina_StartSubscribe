import 'package:flutter/material.dart';

class ButtonNormal extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback onPressed;
  final String text;
  final BuildContext context;
  Color warna;

  ButtonNormal.large({this.onPressed, this.text,this.warna=Colors.orange})
      : width = double.infinity,
        height = 50.0;

  ButtonNormal.small({this.onPressed, this.text,this.warna=Colors.orange})
      : height = 38.0,
        width = double.infinity;

  ButtonNormal(
      {this.height, this.width, this.text, this.onPressed, this.context});

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: onPressed,
      child: new Container(
        width: width,
        height: height,
        color: warna,
        child: new Center(
          child: new Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Text(
              text,
              style: new TextStyle(color: Colors.white,fontSize: 16.0),
            ),
          ),
        ),
      ),
    );
  }
}
