import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback onPressed;
  final String text;
  var icon = Icons.delete;
  String harga;
  String jumlah;

  var position;
  var positionBox;

  CustomBox.large(
      {this.onPressed,
      this.position,
      this.positionBox,
      this.harga,
      this.jumlah})
      : icon = Icons.delete;
  CustomBox.add({this.onPressed}) : icon = Icons.add;

  CustomBox({this.height, this.width, this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: onPressed,
      child: new Container(
        height: 48.0,
        width: (MediaQuery.of(context).size.width / 2) - 48,
        decoration: position != positionBox
            ? new BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(width: 2.0, color: Colors.orange),
                color: Colors.white,
                shape: BoxShape.rectangle,
              )
            : new BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(width: 2.0, color: Colors.orange),
                color: Colors.orange,
                shape: BoxShape.rectangle,
              ),
        child: Center(
            child: position != positionBox
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        jumlah,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: Text(harga, style: TextStyle(fontSize: 11.0)),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        jumlah,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: Text(
                          harga,
                          style: TextStyle(color: Colors.white, fontSize: 11.0),
                        ),
                      )
                    ],
                  )),
      ),
    );
  }
}
