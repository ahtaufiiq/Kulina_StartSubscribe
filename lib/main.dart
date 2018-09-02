import 'package:flutter/material.dart';
import 'package:kulina/components/atoms/button.dart';
import 'package:kulina/components/atoms/button_normal.dart';
import 'package:kulina/components/atoms/text_field.dart';
import 'package:kulina/pageOne.dart';
import 'package:kulina/pageThree.dart';
import 'package:kulina/pageTwo.dart';
import 'package:kulina/stepper_custom.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  int position = 3;
  int positionBox = 1;

  var jumlah = 1;
  var pilihSendiri = 2;
  var hargaPilihSendiri = 25000;
  int harga = 22500;

  var waktu = 20;

  bool isEditProfile = true;

  bool isEditAlamat = true;

  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController number = TextEditingController(text: "2");

  @override
  Widget build(BuildContext context) {
    List<CustomStep> steps = new List();
    _buildStep(context, steps, widget.position);
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: new Text(
          widget.position == 1
              ? "Mulai Langganan"
              : widget.position == 2 ? "Pengantaran" : "Pembayaran",
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {
              if (widget.position > 1) {
                widget.position = widget.position - 1;
              }
            });
          },
        ),
      ),
      body: CustomStepper(
        steps: steps,
        type: StepperType.horizontal,
        currentStep: widget.position - 1,
      ),
    );
  }

  _buildStep(BuildContext mContext, List<CustomStep> lists, int currentStep) {
    var listTitle = ['Mulai', 'Pengiriman', 'Pembayaan'];
    var listContent = [
      PageOne(
        increment: () {
          setState(() {
            widget.jumlah++;
          });
        },
        jumlah: widget.jumlah,
        decrement: () {
          setState(() {
            widget.jumlah--;
          });
        },
        voidCallback: () {
          setState(() {
            widget.position = widget.position + 1;
          });
        },
        box1: () => _pressBox1(),
        harga: widget.harga,
        position: widget.positionBox,
        waktu: widget.waktu,
        box2: () => _pressBox2(),
        box3: () => _pressBox3(),
        box4: () => _pressBox4(),
        hargaPilihSendiri: widget.hargaPilihSendiri,
        pilihSendiri: widget.pilihSendiri,
      ),
      PageTwo(
        voidCallback: () {
          setState(() {
            widget.position = widget.position + 1;
          });
        },
        isEditAlamat: widget.isEditAlamat,
        isEditProfile: widget.isEditProfile,
        editProfile: () {
          setState(() {
            widget.isEditProfile = !widget.isEditProfile;
          });
        },
        editAlamat: () {
          setState(() {
            widget.isEditAlamat = !widget.isEditAlamat;
          });
        },
        jumlah: widget.jumlah,
        harga: widget.harga,
        waktu: widget.waktu,
      ),
      PageThree(
        jumlah: widget.jumlah,
        harga: widget.harga,
        waktu: widget.waktu,
      )
    ];

    print(widget.position);

    for (var i = 0; i < 3; i++) {
      lists.add(new CustomStep(
        title: Text(
          listTitle[i],
        ),
        isActive: i <= currentStep - 1 ? true : false,
        state: StepState.indexed,
        content: listContent[i],
      ));
    }
  }

  _pressBox1() {
    setState(() {
      widget.positionBox = 1;
      widget.waktu = 20;
      widget.harga = 22500;
    });
  }

  _pressBox2() {
    setState(() {
      widget.positionBox = 2;
      widget.waktu = 10;
      widget.harga = 24250;
    });
  }

  _pressBox3() {
    setState(() {
      widget.positionBox = 3;
      widget.waktu = 5;
      widget.harga = 25000;
    });
  }

  _pressBox4() {
    showDialog(
        context: context,
        builder: (_) => new SimpleDialog(
              titlePadding: const EdgeInsets.all(0.0),
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.only(top: 2.0, left: 8.0, right: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[Text(""), Icon(Icons.close)],
                      ),
                      Text("Pilih Periode Langganan"),
                      Padding(
                        padding: const EdgeInsets.only(top: 14.0),
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 6.0),
                            child: new Container(
                                height: 40.0,
                                width: MediaQuery.of(context).size.width - 250,
                                child: Center(
                                    child: TextFieldNumber(
                                  controller: number,
                                ))),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: CustomButton.minus(
                                warna: Colors.grey,
                                onPressed: () {
                                  setState(() {
                                    if (widget.pilihSendiri > 2) {
                                      widget.pilihSendiri--;
                                      number.text =
                                          widget.pilihSendiri.toString();
                                    }
                                  });
                                },
                              )),
                          CustomButton.add(
                              warna: Colors.grey,
                              onPressed: () {
                                setState(() {
                                  widget.pilihSendiri++;
                                  number.text = widget.pilihSendiri.toString();
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
                          widget.pilihSendiri =
                              int.parse(number.text.toString());

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
                              harga =
                                  lama < 10 ? 25000 : lama < 20 ? 24250 : 22500;
                              widget.hargaPilihSendiri = harga;
                          }
                          setState(() {
                            widget.positionBox = position;
                            widget.harga = harga;
                            widget.waktu = lama;
                          });

                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                )
              ],
            ));
  }
}
