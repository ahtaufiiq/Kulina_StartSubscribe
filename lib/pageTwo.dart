import 'package:flutter/material.dart';
import 'package:kulina/components/button_gradient.dart';
import 'package:kulina/components/card_profile.dart';
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
          ),
          CustomCard(
            "Alamat Pengiriman",
            isEditable: true,
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
