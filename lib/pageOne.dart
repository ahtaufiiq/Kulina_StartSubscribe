import 'package:flutter/material.dart';
import 'package:kulina/flutter_calendar.dart';

class PageOne extends StatefulWidget {
  final VoidCallback voidCallback;

  var position = 3;
  var jumlah = 1;

  int harga = 25000;

  var waktu = 10;
  PageOne({this.voidCallback});
  @override
  PageOneState createState() {
    return new PageOneState();
  }
}

class PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0,bottom: 24.0),
      child: Column(
        children: <Widget>[
          Card(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 12.0),
                  child: Text(
                    "Jumlah Box Perhari",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
                _buildBox(),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, bottom: 12.0, top: 12.0),
                  child: Text(
                    "Lama Langganan",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
                _buildLamaLangganan(),
                Card(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(

                    children: <Widget>[
                      Calendar(isExpandable: true,),
                      Padding(padding: const EdgeInsets.only(top:12.0),),
                      Container(
                        color: Colors.greenAccent,
                        padding: const EdgeInsets.all(8.0),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                         Text("Pro Tips"),
                         Text("Atur jadwal langganan dengan menekan tanggal pada kalender.Selesaikan transaksi sebelum pukul 19:00 untuk mulai pengiriman besok")
                       ],), 
                      )
                    ],
                  ),
                )),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, bottom: 12.0, top: 8.0),
                  child: Text(
                    "Rincian Langanan",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
                _buildRincian(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: MaterialButton(
              height: 45.0,
              minWidth: MediaQuery.of(context).size.width,
              child: Text("Selanjutnya"),
              color: Colors.orange,
              textColor: Colors.white,
              onPressed: widget.voidCallback,
            ),
          ),
        ],
      ),
    );
  }

  _buildBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        new Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 14.0),
              child: new Container(
                height: 48.0,
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
              padding: const EdgeInsets.only(right: 8.0),
              child: new GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.jumlah--;
                    });
                  },
                  child: new Container(
                    width: 48.0,
                    height: 48.0,
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(5.0),
                      color: Colors.orange,
                    ),
                    child: new Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 14.0,
                    ),
                  )),
            ),
            new GestureDetector(
                onTap: () {
                  setState(() {
                    widget.jumlah++;
                  });
                },
                child: new Container(
                  
                  width: 48.0,
                  height: 48.0,
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(5.0),
                    color: Colors.orange,
                  ),
                  child: new Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 24.0,
                  ),
                )),
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
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    widget.position = 1;
                    widget.waktu = 20;
                    widget.harga = 22500;
                  });
                },
                child: new Container(
                  height: 48.0,
                  width: (MediaQuery.of(context).size.width / 2) - 48,
                  decoration: widget.position != 1
                      ? new BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(width: 2.0, color: Colors.orange),
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                        )
                      : new BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(width: 2.0, color: Colors.orange),
                          color: Colors.orange,
                          shape: BoxShape.rectangle,
                        ),
                  child: Center(
                      child: widget.position != 1
                          ? Text("1 Box")
                          : Text(
                              "1 Box",
                              style: TextStyle(color: Colors.white),
                            )),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.position = 2;
                  widget.waktu = 10;
                  widget.harga = 24250;
                });
              },
              child: new Container(
                height: 48.0,
                width: (MediaQuery.of(context).size.width / 2) - 48,
                decoration: widget.position != 2
                    ? new BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(width: 2.0, color: Colors.orange),
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                      )
                    : new BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(width: 2.0, color: Colors.orange),
                        color: Colors.orange,
                        shape: BoxShape.rectangle,
                      ),
                child: Center(
                    child: widget.position != 2
                        ? Text("1 Box")
                        : Text(
                            "1 Box",
                            style: TextStyle(color: Colors.white),
                          )),
              ),
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
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    widget.position = 3;
                    widget.waktu = 5;
                    widget.harga = 25000;
                  });
                },
                child: new Container(
                  height: 48.0,
                  width: (MediaQuery.of(context).size.width / 2) - 48,
                  decoration: widget.position != 3
                      ? new BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(width: 2.0, color: Colors.orange),
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                        )
                      : new BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(width: 2.0, color: Colors.orange),
                          color: Colors.orange,
                          shape: BoxShape.rectangle,
                        ),
                  child: Center(
                      child: widget.position != 3
                          ? Text("1 Box")
                          : Text(
                              "1 Box",
                              style: TextStyle(color: Colors.white),
                            )),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.position = 4;
                });
              },
              child: new Container(
                height: 48.0,
                width: (MediaQuery.of(context).size.width / 2) - 48,
                decoration: widget.position != 4
                    ? new BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(width: 2.0, color: Colors.orange),
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                      )
                    : new BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(width: 2.0, color: Colors.orange),
                        color: Colors.orange,
                        shape: BoxShape.rectangle,
                      ),
                child: Center(
                    child: widget.position != 4
                        ? Text("1 Box")
                        : Text(
                            "1 Box",
                            style: TextStyle(color: Colors.white),
                          )),
              ),
            )
          ],
        ),
      ],
    );
  }

  _buildRincian() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[Text("Harga per box"), Text("Rp ${widget.harga}")],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Jumlah Box"),
            Text("${widget.jumlah} Box"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Lama Langganan"),
            Text("${widget.waktu} Hari")
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Total Harga"),
            Text("Rp ${widget.harga*widget.jumlah}")
          ],
        )
      ],
    );
  }
}
