import 'package:flutter/material.dart';
import 'package:kulina/components/box.dart';
import 'package:kulina/components/button.dart';
import 'package:kulina/components/button_gradient.dart';
import 'package:kulina/components/button_normal.dart';
import 'package:kulina/components/text.dart';
import 'package:kulina/components/text_field.dart';
import 'package:kulina/flutter_calendar.dart';

class PageOne extends StatefulWidget {
  final VoidCallback voidCallback;

  var position = 1;
  var jumlah = 1;
  var pilihSendiri = 2;

  int harga = 25000;

  var waktu = 10;

  bool inisiasiDate = true;
  PageOne({this.voidCallback});
  @override
  PageOneState createState() {
    return new PageOneState();
  }
}

class PageOneState extends State<PageOne> {
  TextEditingController number = TextEditingController(text: "2");
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
      child: Column(
        children: <Widget>[
          Card(
            elevation: 8.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 12.0, bottom: 12.0, top: 8.0),
                  child: CustomText.title(
                    text: "Jumlah box per hari",
                  ),
                ),
                _buildBox(),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 12.0, bottom: 12.0, top: 28.0),
                  child: CustomText.title(
                    text: "Lama Langganan",
                  ),
                ),
                _buildLamaLangganan(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Calendar(
                        isExpandable: true,
                      ),
                      Padding(padding: const EdgeInsets.only(top:4.0),),
                      widget.pilihSendiri > 40 && widget.position==4
                          ? Text(
                              "Maksimal waktu berlangganan 40 hari",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            )
                          : Container(),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                      ),
                      Container(
                        color: const Color(0xFFf2e596),
                        margin: const EdgeInsets.only(bottom: 12.0),
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Pro Tips",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                  "Atur jadwal langganan dengan menekan tanggal pada kalender.Selesaikan transaksi sebelum pukul 19:00 untuk mulai pengiriman besok"),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            elevation: 8.0,
            margin: const EdgeInsets.only(top: 16.0),
            child: _buildRincian(),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 12.0, top: 16.0),
            child: ButtonGradient.large(
              text: "Selanjutnya",
              onPressed: widget.voidCallback,
            ),
          ),
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

  _buildBox() {
    return Row(
      children: [
        new Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 6.0),
              child: new Container(
                height: 40.0,
                width: MediaQuery.of(context).size.width - 192,
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(width: 2.0, color: Colors.orange),
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                ),
                child: Center(child: Text("${widget.jumlah} Box")),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: CustomButton.minus(
                  onPressed: () {
                    setState(() {
                      if (widget.jumlah > 1) {
                        widget.jumlah--;
                      }
                    });
                  },
                )),
            CustomButton.add(onPressed: () {
              setState(() {
                widget.jumlah++;
              });
            })
          ],
        ),
      ],
    );
  }

  _buildLamaLangganan() {
    return new Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CustomBox.large(
                onPressed: () {
                  setState(() {
                    widget.position = 1;
                    widget.waktu = 20;
                    widget.harga = 22500;
                  });
                },
                position: widget.position,
                positionBox: 1,
                harga: "Rp 22.500/hari",
                jumlah: "20 Hari",
              ),
            ),
            CustomBox.large(
              onPressed: () {
                setState(() {
                  widget.position = 2;
                  widget.waktu = 10;
                  widget.harga = 24250;
                });
              },
              harga: "Rp 24.250/hari",
              jumlah: "10 Hari",
              position: widget.position,
              positionBox: 2,
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CustomBox.large(
                onPressed: () {
                  setState(() {
                    widget.position = 3;
                    widget.waktu = 5;
                    widget.harga = 25000;
                  });
                },
                jumlah: "5 Hari",
                harga: "Rp 25.000/hari",
                position: widget.position,
                positionBox: 3,
              ),
            ),
            CustomBox.large(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) => new SimpleDialog(
                          titlePadding: const EdgeInsets.all(0.0),
                          children: <Widget>[
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.only(
                                  top: 2.0, left: 8.0, right: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(""),
                                      Icon(Icons.close)
                                    ],
                                  ),
                                  Text("Pilih Periode Langganan"),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 14.0),
                                  ),
                                  new Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 6.0),
                                        child: new Container(
                                            height: 40.0,
                                            width: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .width -
                                                250,
                                            decoration: new BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              border: Border.all(
                                                  width: 2.0,
                                                  color: Colors.grey),
                                              color: Colors.white,
                                              shape: BoxShape.rectangle,
                                            ),
                                            child: Center(
                                                child: TextFieldNumber(
                                              controller: number,
                                            ))),
                                      ),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(right: 4.0),
                                          child: CustomButton.minus(
                                            warna: Colors.grey,
                                            onPressed: () {
                                              setState(() {
                                                if (widget.pilihSendiri > 2) {
                                                  widget.pilihSendiri--;
                                                  number.text = widget
                                                      .pilihSendiri
                                                      .toString();
                                                }
                                              });
                                            },
                                          )),
                                      CustomButton.add(
                                          warna: Colors.grey,
                                          onPressed: () {
                                            setState(() {
                                              widget.pilihSendiri++;
                                              number.text = widget.pilihSendiri
                                                  .toString();
                                            });
                                          })
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 14.0),
                                  ),
                                  ButtonNormal.small(
                                    text: "Ok",
                                    warna: Colors.red,
                                    onPressed: () {
                                      if (int.parse(number.text.toString()) >
                                          widget.pilihSendiri) {
                                        widget.pilihSendiri =
                                            int.parse(number.text.toString());
                                      }
                                      int lama = widget.pilihSendiri;
                                      int position = 0;
                                      int harga = 0;
                                      switch (lama) {
                                        case 5:
                                          position = 3;
                                          harga = 25000;
                                          break;
                                        case 10:
                                          position = 2;
                                          harga = 24250;
                                          break;
                                        case 20:
                                          position = 1;
                                          harga = 22500;
                                          break;
                                        default:
                                          position = 4;
                                          harga = lama < 10
                                              ? 25000
                                              : lama < 20 ? 24250 : 22500;
                                      }
                                      setState(() {
                                        widget.position = position;
                                        widget.harga = harga;
                                      });

                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              ),
                            )
                          ],
                        ));
              },
              position: widget.position,
              positionBox: 4,
              jumlah: widget.pilihSendiri != 1 &&
                      widget.pilihSendiri != 5 &&
                      widget.pilihSendiri != 10 &&
                      widget.pilihSendiri != 20
                  ? "${widget.pilihSendiri} Hari"
                  : "Pilih Sendiri",
              harga: widget.pilihSendiri != 1 &&
                      widget.pilihSendiri != 5 &&
                      widget.pilihSendiri != 10 &&
                      widget.pilihSendiri != 20
                  ? "Rp ${widget.harga}/hari"
                  : "Min. 2 Hari",
            )
          ],
        ),
      ],
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
}
