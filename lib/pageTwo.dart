import 'package:flutter/material.dart';
import 'package:kulina/components/button_gradient.dart';
import 'package:kulina/components/custom_card.dart';
import 'package:kulina/components/text.dart';

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
          CustomCard(
            "Profil Kamu",
            isEditable: true,
            widget: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomText.title(
                  text: "Ahmad Taufiq",
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                  child: Text(
                    "ataufiq665@gmail.com",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Text("628978787", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          CustomCard(
            "Alamat Pengiriman",
            isEditable: true,
            widget: Container(
              decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.circular(5.0)),
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[Text("Kulina"), Text("edit")],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:4.0,right: 4.0),
                    child: Text("Jalan Tulodong Atas, RT.6, Senayan, South Jakarta City, Jakarta, Indonesia"),
                  )
                ],
              ),
            ),
          ),
          CustomCard(
            "Rincian Pelanggan",
          ),
          Container(
            margin: const EdgeInsets.all(14.0),
            child: ButtonGradient.large(
              text: "Selanjutnya",
              onPressed: widget.voidCallback,
            ),
          )
        ],
      ),
    );
  }

  _buildProfile() {
    return Card(
      child: CustomText.title(
        text: "Profil Kamu",
      ),
    );
  }
}
