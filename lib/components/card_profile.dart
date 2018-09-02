import 'package:flutter/material.dart';
import 'package:kulina/components/atoms/button_dialog.dart';
import 'package:kulina/components/atoms/button_gradient.dart';
import 'package:kulina/components/atoms/text.dart';
import 'package:kulina/components/atoms/text_field.dart';

class CardProfile extends StatefulWidget {
  DateTime _fromDate = new DateTime.now();
  DateTime _toDate = new DateTime.now();

  bool isEditable = false;
  bool inisiasiDate=true;
  @override
  CardProfileState createState() {
    return new CardProfileState();
  }
}

class CardProfileState extends State<CardProfile> {

  TextEditingController textDegree = new TextEditingController();
  TextEditingController textFieldOfStudy = new TextEditingController();
  TextEditingController textSchool = new TextEditingController();
  TextEditingController ipk = new TextEditingController();
  TextEditingController textDate = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(12.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              new CustomText.title(text: "Education"),
              GestureDetector(child: new Icon(Icons.close),onTap: (){Navigator.pop(context, "Save");},)
            ],
          ),
          new TextFieldText(
            labelText: "School",
            controller: textSchool,
          ),
          new TextFieldEmail(
            labelText: "Degree",
            controller: textDegree,
          ),
          new TextFieldText(
            labelText: "Field of Study",
            controller: textFieldOfStudy,
          ),
          new TextFieldText(
            labelText: "IPK",
            controller: ipk,
          ),
          new Padding(
            padding: const EdgeInsets.only(top: 30.0),
          ),
          widget.isEditable
              ? new ButtonDialog(
                  textRedButton: "Delete",
                  textGreenButton: "Save",
                  onPressedRed: () {
                  },
                  onPressedGreen: () {
                  },
                )
              : new ButtonGradient.large(
                  text: "Save",
                  onPressed: () {
                  },
                )
        ],
      ),
    );
  }
}
