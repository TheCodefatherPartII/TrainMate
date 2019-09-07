import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
const String _name = "Anonymous";

class ChatMessage extends StatelessWidget {

  final String _avatarUrlBase = "https://avatars.dicebear.com/v2/human/";

  final String identity;
  final String text;
  final DateTime date;

// constructor to get text from textfield
  ChatMessage({
    this.identity,
    this.text,
    this.date
  });

  @override
  Widget build(BuildContext context) {

    return new Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: new CircleAvatar(
                child: new SvgPicture.network("$_avatarUrlBase$identity.svg"),
              ),
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(_name, style: Theme.of(context).textTheme.subhead),
                new Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: new Text(text),

                )
              ],
            )
          ],
        )
    );
  }
}