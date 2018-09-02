import 'package:flutter/material.dart';

class TextFieldPassword extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  TextFieldPassword({this.labelText, this.controller});

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TextFormField(
        autofocus: false,
        obscureText: true,
        controller: controller,
        decoration: new InputDecoration(
            labelText: labelText,
            labelStyle:
                new TextStyle(fontSize: 16.0, fontFamily: 'Avenir-Medium')),
      ),
    );
  }
}

class TextFieldEmail extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  TextFieldEmail({this.labelText, this.controller});

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(width: 1.0, color: Colors.grey)),
      padding: const EdgeInsets.only(left: 8.0),
      child: new TextFormField(
        autofocus: false,
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        decoration: new InputDecoration(
            border: InputBorder.none,
            labelText: labelText,
            labelStyle:
                new TextStyle(fontSize: 16.0, fontFamily: 'Avenir-Medium')),
      ),
    );
  }
}

class TextFieldText extends StatelessWidget {
  final String labelText;
  String nama;
  final TextEditingController controller;
  TextFieldText({this.labelText, this.nama, this.controller});

  @override
  Widget build(BuildContext context) {
    var textPosition;
    return new Container(
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(width: 1.0, color: Colors.grey)),
      padding: const EdgeInsets.only(left: 8.0),
      child: new TextFormField(
        autofocus: false,
        controller: controller,
        decoration: new InputDecoration(
            border: InputBorder.none,
            labelText: labelText,
            labelStyle: new TextStyle(fontSize: 16.0)),
      ),
    );
  }
}

class TextFieldNumber extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  TextFieldNumber({this.labelText, this.controller});

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(width: 1.0, color: Colors.grey)),
      padding: const EdgeInsets.only(left: 8.0),
      child: new TextFormField(
        autofocus: false,
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: new InputDecoration(
            border: InputBorder.none,
            labelText: labelText,
            labelStyle: new TextStyle(fontSize: 14.0)),
      ),
    );
  }
}

class TextFieldEsay extends StatelessWidget {
  final String placeholder;
  final bool editable;
  final String text;
  final ValueChanged<String> valueChange;
  final TextEditingController controller;

  TextFieldEsay(
      {this.placeholder,
      this.editable = true,
      this.text,
      this.valueChange,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: editable
          ? new TextField(
              controller: controller,
              autofocus: false,
              maxLines: 7,
              keyboardType: TextInputType.multiline,
              onChanged: valueChange,
              decoration: new InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: placeholder,
                  labelStyle: new TextStyle(
                      fontSize: 18.0, fontFamily: 'Avenir-Heavy')),
            )
          : new FocusScope(
              node: new FocusScopeNode(),
              child: new TextFormField(
                autofocus: false,
                maxLines: 7,
                initialValue: text,
                controller: controller,
                keyboardType: TextInputType.multiline,
                decoration: new InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: placeholder,
                    labelStyle: new TextStyle(
                        fontSize: 18.0, fontFamily: 'Avenir-Heavy')),
              ),
            ),
    );
  }
}
