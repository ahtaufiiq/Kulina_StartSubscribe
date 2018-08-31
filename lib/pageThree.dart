import 'package:flutter/material.dart';
import 'package:kulina/components/button_gradient.dart';
import 'package:kulina/components/custom_card.dart';

class PageThree extends StatefulWidget {
  var checkboxValue = false;

  var checkboxKredit = true;

  @override
  PageThreeState createState() {
    return new PageThreeState();
  }
}

class PageThreeState extends State<PageThree> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CustomCard(
            "Pilih Metode Pembayaran",
            widget: Column(
              children: <Widget>[
                Card(
                  elevation: 4.0,
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                new Checkbox(
                                  activeColor: Colors.orange,
                                  value: widget.checkboxKredit,
                                  onChanged: (bool value) {
                                    setState(() {
                                      widget.checkboxValue = !value;
                                      widget.checkboxKredit = value;
                                    });
                                  },
                                ),
                                Text("Kartu Kredit"),
                              ],
                            ),
                            Text("Visa dll")
                          ],
                        ),
                       widget.checkboxKredit? Column(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 24.0, bottom: 14.0),
                              width: double.infinity,
                              height: 1.0,
                              color: Colors.grey[300],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Perpanjangan Otomatis: Tidak"),
                                Text("Switch")
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 14.0),
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.lock),
                                  Text("Keamanan dijamin 100% ")
                                ],
                              ),
                            )
                          ],
                        ):Container()
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 4.0,
                  child: Container(
                    padding: const EdgeInsets.all(14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            new Checkbox(
                              activeColor: Colors.orange,
                              value: widget.checkboxValue,
                              onChanged: (bool value) {
                                setState(() {
                                  widget.checkboxValue = value;
                                  widget.checkboxKredit = !value;
                                });
                              },
                            ),
                            Text("Transfer Bank"),
                          ],
                        ),
                        Text("BCA Dll")
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          CustomCard(
            "Ringkasan Pembayaran",
          ),
          Container(
              margin:
                  const EdgeInsets.only(left: 14.0, right: 14.0, bottom: 14.0),
              child: ButtonGradient.large(
                text: "BAYAR",
              ))
        ],
      ),
    );
  }
}
