import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trainmate/screens/bubble_chat.dart';
import 'package:trainmate/user.dart';

class ChatMessage extends StatelessWidget {
  final String identity;
  final String name;
  final String image;
  final Color colour;
  final String text;
  final DateTime date;
  final bool isBroadcast;
  final bool isMe;

  // constructor to get text from textfield
  ChatMessage({
    this.identity,
    this.name,
    this.image,
    this.colour,
    this.text,
    this.date,
    this.isBroadcast,
    this.isMe
  });

  @override
  Widget build(BuildContext context) {
    final user = User.of(context);
    final textTheme = Theme.of(context).textTheme;
    final isMyMessage = user.id == identity;

    final avatar = Container(
      child: CircleAvatar(
        backgroundColor: this.colour,
        child: SvgPicture.network(this.image),
      ),
    );

    if (isBroadcast) {
      return Bubble(message: this.text,
          time: '12:00',
          delivered: true,
          isMe: false,
          isBroadcast: isBroadcast);
    } else {
      return ListTile(
        dense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 5),
        leading: isMyMessage ? null : avatar,
        trailing: isMyMessage ? avatar : null,
        title: Text(
          isMyMessage ? '${this.name} (you)' : this.name,
          style: textTheme.subhead.copyWith(fontWeight: FontWeight.bold),
          textAlign: isMyMessage ? TextAlign.right: TextAlign.left,
        ),
        subtitle: Bubble(message: this.text,
            time: '12:00',
            delivered: true,
            isMe: this.isMe, isBroadcast: isBroadcast),
      );
    }
  }
}
