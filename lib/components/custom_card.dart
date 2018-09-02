import 'package:flutter/material.dart';
import 'package:kulina/components/atoms/text.dart';

class CustomCard extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isEditable;
  final Widget widget;
  String text;

  CustomCard(this.text, {this.widget, this.onPressed, this.isEditable = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(14.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new CustomText.title(text: text),
                isEditable
                    ? new GestureDetector(
                        onTap: onPressed,
                        child: Text(
                          "Ubah",
                          style: TextStyle(
                              fontSize: 13.0,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold),
                        ))
                    : new Container(),
              ],
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 6.0,bottom: 12.0),
            ),
            widget == null ? Container() : widget
          ],
        ),
      ),
    );
  }
}
