import 'package:code_input/code_input.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trainmate/api.dart';

class OnboardingPage extends StatefulWidget {
  OnboardingPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  String carriageId;

  final CodeInputBuilder codeInputBuilder = CodeInputBuilders.containerized(
    emptySize: new Size(45, 60),
    filledSize: new Size(60, 60),
    totalSize: new Size(60, 60),

    emptyDecoration: new BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
    filledDecoration: null,

    emptyTextStyle: null,
    filledTextStyle: new TextStyle(color: Colors.black87, fontSize: 35.0)
  );

  final controller = TextEditingController();

  _goToChatPage() async {
    FocusScope.of(context).unfocus();

    Navigator.of(context).pushNamed(
      '/pick-destination',
      arguments: {'carriageId': carriageId},
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // Column is also layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // a  xis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                height: 280,
                child: new Padding(
                  padding: EdgeInsets.all(80.0),
                  child: new Image.asset(
                    'images/logo_w.png',
                  ),
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/background.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Spacer(),
              new Text("Hello", style: TextStyle(fontSize: 28)),
              new Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: CodeInput(
                  length: 4,
                  keyboardType: TextInputType.number,
                  builder: codeInputBuilder,
                  onFilled: (value) {
                    setState(() {
                     carriageId = value.trim(); 
                    });
                  },
                )
              ),
              ButtonTheme(
                  minWidth: 150.0,
                  child: RaisedButton(
                    padding: EdgeInsets.all(10.0),
                    onPressed: _goToChatPage,
                    color: Colors.deepOrange,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    child: const Text('GO',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  )),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text("Need Help?", style: TextStyle(fontSize: 12)),
              ),
              IconButton(
                icon: Icon(Icons.camera),
                iconSize: 30,
                tooltip: 'Take a picture of train carriage number',
                onPressed: () {},
              ),
            ],
          ),
        ));
  }
}
