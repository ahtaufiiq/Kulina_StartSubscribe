import 'package:flutter/material.dart';
import 'package:kulina/components/atoms/button_gradient.dart';
import 'package:kulina/components/atoms/text.dart';
import 'package:kulina/components/custom_card.dart';

class PageThree extends StatefulWidget {
  var checkboxValue = false;
  var isSwitch = false;
  var checkboxKredit = true;
  
  var jumlah = 1;
  int harga;
  var waktu;

PageThree({this.jumlah=1,this.harga=25000,this.waktu=10});
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
                            Image.asset('images/logo_credit.png',height: 25.0,)
                          ],
                        ),
                        widget.checkboxKredit
                            ? Column(
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 24.0, bottom: 14.0),
                                    width: double.infinity,
                                    height: 1.0,
                                    color: Colors.grey[300],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 12.0, right: 4.0),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1.0,
                                            color: Colors.grey[300])),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              "Perpanjangan Otomatis: ",
                                              style: TextStyle(
                                                  color: Colors.grey[600]),
                                            ),
                                            Text(
                                              widget.isSwitch ? 'Ya' : 'Tidak',
                                              style: TextStyle(
                                                  color: Colors.grey[600],
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                        Switch(
                                          value: widget.isSwitch,
                                          activeColor: Colors.green,
                                          onChanged: (bool value) {
                                            setState(() {
                                              widget.isSwitch =
                                                  !widget.isSwitch;
                                            });
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(top: 14.0),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Icons.lock,
                                            size: 16.0,
                                            color: Colors.grey[600]),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                        ),
                                        Flexible(
                                          child: Text(
                                            "Keamanan dijamin 100% (256 bit encryption), batalkan langganan kapanpun dengan pengembalian penuh.",
                                            style: TextStyle(
                                                color: Colors.grey[600]),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            : Container()
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
                        Image.asset('images/logo_bank.png',height: 20.0,)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Card(
            margin: const EdgeInsets.all(16.0),
            child: _buildRincian(),
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

  _buildRincian() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 4.0, top: 8.0),
            child: CustomText.title(
              text: "Rincian Langganan",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildText("Harga per box"),
                _buildText("Rp ${widget.harga}")
              ],
            ),
          ),
          Container(
            color: Colors.grey,
            width: double.infinity,
            height: 0.2,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildText("Jumlah Box"),
                _buildText("${widget.jumlah} Box"),
              ],
            ),
          ),
          Container(
            color: Colors.grey,
            width: double.infinity,
            height: 0.3,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildText("Lama Langganan"),
                _buildText("${widget.waktu} Hari")
              ],
            ),
          ),
          Container(
            color: Colors.grey,
            width: double.infinity,
            height: 0.3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, left: 8.0, right: 8.0, bottom: 14.0),
                child: CustomText.title(text: "Total "),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    CustomText.title(text: "Rp ${widget.harga*widget.jumlah}"),
              )
            ],
          )
        ],
      ),
    );
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
