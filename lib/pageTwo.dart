import 'package:flutter/material.dart';

class PageTwo extends StatefulWidget {
  final VoidCallback voidCallback;
  PageTwo({this.voidCallback});
  @override
  PageTwoState createState() {
    return new PageTwoState();
  }
}

class PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          MaterialButton(
            child: Text("Selanjutnya"),
            color: Colors.orange,
            textColor: Colors.white,
            onPressed: widget.voidCallback,
          )
        ],
      ),
    );
  }
}
