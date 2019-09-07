import 'package:code_input/code_input.dart';

import 'package:flutter/material.dart';

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
      emptySize: Size(45, 60),
      filledSize: Size(60, 60),
      totalSize: Size(60, 60),
      emptyDecoration:
          BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
      filledDecoration: null,
      emptyTextStyle: null,
      filledTextStyle: TextStyle(color: Colors.black87, fontSize: 35.0));

  final controller = TextEditingController();

  _chooseYourDestination() async {
    FocusScope.of(context).unfocus();

    Navigator.of(context).pushNamed(
      '/pick-destination',
      arguments: {'carriageId': carriageId},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: true,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.png'),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(80.0),
                  child: Image.asset('images/logo_w.png'),
                ),
                Spacer(),
                Text("Enter your carriage number",
                    style: TextStyle(fontSize: 20)),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: CodeInput(
                      length: 5,
                      keyboardType: TextInputType.text,
                      builder: codeInputBuilder,
                      onFilled: (value) {
                        setState(() {
                          carriageId = value.trim();
                        });
                      },
                    )),
                RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40),
                  onPressed: _chooseYourDestination,
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: const Text(
                    'JOIN',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Need Help?", style: TextStyle(fontSize: 12)),
                ),
                Spacer(),
              ],
            ),
          ),
        ));
  }
}
