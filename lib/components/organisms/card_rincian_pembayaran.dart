import 'package:flutter/material.dart';
import 'package:kulina/components/atoms/text.dart';
import 'package:kulina/components/molecules/custom_card.dart';

class CardRincianPembayaran extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isEditable;
  final Widget widget;
  int harga,waktu,jumlah;
  double elevation;


  CardRincianPembayaran({this.harga,this.waktu,this.widget,this.jumlah, this.onPressed, this.isEditable = false, this.elevation=3.0});

  @override
  Widget build(BuildContext context) {
    return CustomCard("Rincian Langganan",
    elevation: elevation,
              widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CustomText.medium(text:"Harga per box"),
                _buildText("Rp ${harga}")
              ],
            ),
            Container(
              color: Colors.grey,
              width: double.infinity,
              height: 0.2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CustomText.medium(text:"Jumlah Box"),
                _buildText("${jumlah} Box"),
              ],
            ),
            Container(
              color: Colors.grey,
              width: double.infinity,
              height: 0.3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CustomText.medium(text:"Lama Langganan"),
                _buildText("${waktu} Hari")
              ],
            ),
            Container(
              color: Colors.grey,
              width: double.infinity,
              height: 0.3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CustomText.title(text: "Total "),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText.title(
                      text: "Rp ${harga*jumlah}"),
                )
              ],
            )
          ],
        ),);
  }
    _buildText(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomText.medium(
        text: text,
      ),
    );
  }
}
