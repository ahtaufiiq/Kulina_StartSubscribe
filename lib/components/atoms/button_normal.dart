import 'package:flutter/material.dart';

class ButtonNormal extends StatelessWidget {
  final double width;
  final double height;
  bool isIcon;
  final VoidCallback onPressed;
  final String text;
  Color warna;
  var icon = Icons.minimize;

  ButtonNormal(
      {this.onPressed, this.warna = Colors.red, this.isIcon: false, this.text})
      : icon = Icons.add,
        height = 38.0,
        width = double.infinity;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: onPressed,
        child: new Container(
          width: width,
          height: height,
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(3.0),
            color: warna,
          ),
          child: isIcon
              ? new Icon(
                  icon,
                  color: Colors.white,
                  size: 24.0,
                )
              : new Center(
                  child: new Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new Text(
                      text,
                      style: new TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ),
        ));
  }
}
