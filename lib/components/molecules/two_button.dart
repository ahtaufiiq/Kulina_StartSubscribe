import 'package:flutter/material.dart';
import 'package:kulina/components/atoms/button_gradient.dart';

class TwoButton extends StatelessWidget {
  final double width;
  final double height;
  bool isIcon;
  final VoidCallback onPressedOk;
  final VoidCallback onPressedCancel;
  final String text;
  Color warna;
  var icon = Icons.minimize;

  TwoButton(
      {this.onPressedOk, this.onPressedCancel,this.warna = Colors.orange, this.isIcon: true})
      : icon = Icons.remove,
        width = 52.0,
        height = 40.0;

  @override
  Widget build(BuildContext context) {
    return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            GestureDetector(
              onTap: onPressedCancel,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text("Batal"),
              ),
            ),
            ButtonGradient.small(
              text: "Simpan",
              onPressed:onPressedOk,
            )
          ],
        );
  }
  
}
