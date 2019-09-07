import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trainmate/user.dart';

class ChatMessage extends StatelessWidget {
  final String identity;
  final String name;
  final String text;
  final DateTime date;

// constructor to get text from textfield
  ChatMessage({
    this.identity,
    this.name,
    this.text,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    final user = User.of(context);

    final isMyMessage = user.id == identity;

    final avatar = Container(
      margin: const EdgeInsets.only(right: 16.0),
      child: CircleAvatar(
        child: SvgPicture.network(user.image),
      ),
    );
    
    final nameAndMessage = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(this.name, style: Theme.of(context).textTheme.subhead),
        Container(
          margin: const EdgeInsets.only(top: 5.0),
          child: Text(text),
        )
      ],
    );

    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          crossAxisAlignment:
              isMyMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: <Widget>[
            isMyMessage ? nameAndMessage : avatar,
            isMyMessage ? avatar : nameAndMessage,
          ],
        ));
  }
}
