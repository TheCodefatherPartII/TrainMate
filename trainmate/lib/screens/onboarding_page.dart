import 'package:code_input/code_input.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UppercaseTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text.trim().toUpperCase().replaceAll("\s+", "");
    String output = '';

    if (newText.length >= 1) {
      output = newText.substring(0, 1).replaceAll(r"[0-9]+", "");

      if (newText.length >= 2) {
        output += newText.substring(1).replaceAll(r"[A-Z]+", "");
      }
    }

    return TextEditingValue(
        selection: newValue.selection,
        text: output,
    );
  }
}


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
  bool isDisabled = true;

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
    final pattern = new RegExp(r"[a-zA-Z]\d{4}");

    if (!pattern.hasMatch(carriageId)) {
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Invalid carriage number'),
            content: const Text('Carriage numbers start with ONE letter followed by four numbers.\r\ne.g. N4132'),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );

      return;
    }

    FocusScope.of(context).unfocus();

    Navigator.of(context).pushNamed(
      '/pick-destination',
      arguments: {'carriageId': carriageId},
    );
  }

  @override
  Widget build(BuildContext context) {
    final isKeyboardShowing = MediaQuery.of(context).viewInsets.bottom > 0;

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
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 80, right: 80, bottom: isKeyboardShowing ? 120 : 240, top: 85),
                  child: Image.asset('images/logo_w.png'),
                ),
                Text("Enter your carriage number",
                    style: TextStyle(fontSize: 20)),
                Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: CodeInput(
                      length: 5,
                      inputFormatters: [new UppercaseTextInputFormatter(), new LengthLimitingTextInputFormatter(5)],
                      keyboardType: TextInputType.text,
                      builder: codeInputBuilder,
                      onChanged: (value) {
                        setState(() {
                          carriageId = value.trim();
                          final isComplete = carriageId.length == 5;

                          setState(() {
                            isDisabled = !isComplete;
                          });

                          if (isComplete) {
                            _chooseYourDestination();
                          }
                        });
                      },
                    )),
              ],
            ),
          ),
        ));
  }
}
