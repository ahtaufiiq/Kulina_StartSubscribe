import 'package:flutter/material.dart';
import 'package:kulina/components/atoms/box.dart';
import 'package:kulina/components/atoms/button_icon.dart';
import 'package:kulina/components/atoms/button_gradient.dart';
import 'package:kulina/components/atoms/text.dart';
import 'package:kulina/components/atoms/text_field.dart';
import 'package:kulina/components/organisms/card_rincian_pembayaran.dart';
import 'package:kulina/components/widget/flutter_calendar.dart';

class PageOne extends StatefulWidget {
  final VoidCallback voidCallback;
  final VoidCallback decrement;
  final VoidCallback increment;
  final VoidCallback box1;
  final VoidCallback box2;
  final VoidCallback box3;
  final VoidCallback box4;
  var position = 1;
  var jumlah = 1;
  var pilihSendiri = 2;
  var hargaPilihSendiri = 25000;
  int harga = 22500;

  var waktu = 20;

  bool inisiasi = true;
  PageOne(
      {this.voidCallback,
      this.jumlah = 1,
      this.decrement,
      this.pilihSendiri,
      this.hargaPilihSendiri,
      this.increment,
      this.box1,
      this.position = 1,
      this.harga = 22500,
      this.waktu = 20,
      this.box2,
      this.box3,
      this.box4});
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
      padding: const EdgeInsets.only(left: 14.0, right: 14.0, bottom: 24.0),
      child: Column(
        children: <Widget>[
          Card(
            elevation: 5.0,
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
                _buildCalendar()
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: CardRincianPembayaran(
              harga: widget.harga,
              waktu: widget.waktu,
              jumlah: widget.jumlah,
              elevation:5.0
            ),
          ),
          _buildButtonSelanjutnya()
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 14.0, right: 6.0),
              child: new Container(
                height: 45.0,
                width: MediaQuery.of(context).size.width/2,
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
                  onPressed: widget.decrement,
                )),
            CustomButton.add(onPressed: widget.increment)
          ],
        ),
      ],
    );
  }

  _buildLamaLangganan() {
    return new Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 14.0,left: 14.0),
              child: CustomBox.large(
                onPressed: widget.box1,
                position: widget.position,
                positionBox: 1,
                harga: "Rp 22.500/hari",
                jumlah: "20 Hari",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right:14.0),
              child: CustomBox.large(
                onPressed: widget.box2,
                harga: "Rp 24.250/hari",
                jumlah: "10 Hari",
                position: widget.position,
                positionBox: 2,
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0,left: 14.0),
              child: CustomBox.large(
                onPressed: widget.box3,
                jumlah: "5 Hari",
                harga: "Rp 25.000/hari",
                position: widget.position,
                positionBox: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 14.0),
              child: CustomBox.large(
                onPressed: widget.box4,
                position: widget.position,
                positionBox: 4,
                jumlah: widget.pilihSendiri != 2 &&
                        widget.pilihSendiri != 5 &&
                        widget.pilihSendiri != 10 &&
                        widget.pilihSendiri != 20
                    ? "${widget.pilihSendiri} Hari"
                    : "Pilih Sendiri",
                harga: widget.pilihSendiri != 2 &&
                        widget.pilihSendiri != 5 &&
                        widget.pilihSendiri != 10 &&
                        widget.pilihSendiri != 20
                    ? "Rp ${widget.hargaPilihSendiri}/hari"
                    : "Min. 2 Hari",
              ),
            )
          ],
        ),
      ],
    );
  }

  _buildCalendar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Calendar(
            isExpandable: true,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
          ),
          widget.pilihSendiri > 40 && widget.position == 4
              ? Text(
                  "Maksimal waktu berlangganan 40 hari",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                )
              : Container(),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
          ),
          _buildProTips()
        ],
      ),
    );
  }

  _buildProTips() {
    return Container(
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
    );
  }

  _buildButtonSelanjutnya() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0, top: 16.0),
      child: ButtonGradient.large(
        text: "Selanjutnya",
        onPressed: widget.voidCallback,
      ),
    );
  }
}
