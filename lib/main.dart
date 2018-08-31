import 'package:flutter/material.dart';
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
  int position = 2;

  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    List<CustomStep> steps = new List();
    _buildStep(context, steps, widget.position);
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: new Text(
          widget.position==1?
          "Mulai Langganan":widget.position==2?"Pengantaran":"Pembayaran",
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
      PageOne(voidCallback: () {
        setState(() {
          widget.position = widget.position + 1;
        });
      }),
      PageTwo(voidCallback: () {
        setState(() {
          widget.position = widget.position + 1;
        });
      }),
      PageThree()
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
}
