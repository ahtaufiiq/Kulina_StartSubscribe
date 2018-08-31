import 'package:flutter/material.dart';
import 'package:kulina/components/button.dart';
import 'package:kulina/components/button_gradient.dart';

class ButtonDialog extends StatelessWidget {
  final VoidCallback onPressedRed;
  final VoidCallback onPressedGreen;
  final String textRedButton;
  final String textGreenButton;
  final MainAxisAlignment mainAxisAlignment;

  ButtonDialog(
      {this.onPressedGreen,
      this.onPressedRed,
      this.textGreenButton,
      this.textRedButton,
      this.mainAxisAlignment = MainAxisAlignment.spaceBetween});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Row(
        mainAxisAlignment: mainAxisAlignment,
        children: <Widget>[
          new CustomButton.minus(
            onPressed: onPressedRed,
          ),
          new ButtonGradient.small(
            text: textGreenButton,
            onPressed: onPressedGreen,
          ),
        ],
      ),
    );
  }
}
