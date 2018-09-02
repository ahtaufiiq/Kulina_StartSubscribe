import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback onPressed;
  final String text;
  Color warna;
  var icon = Icons.minimize;

  CustomButton.minus({this.onPressed,this.warna=Colors.orange}) : icon = Icons.remove;
  CustomButton.add({this.onPressed,this.warna=Colors.orange}) : icon = Icons.add;

  CustomButton({this.height, this.width, this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: onPressed,
        child: new Container(
          width: 52.0,
          height: 40.0,
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(5.0),
            color: warna,
          ),
          child: new Icon(
            icon,
            color: Colors.white,
            size: 24.0,
          ),
        ));
  }
}
