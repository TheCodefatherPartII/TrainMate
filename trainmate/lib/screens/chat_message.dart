import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trainmate/screens/bubble_chat.dart';
import 'package:trainmate/user.dart';
import 'package:trainmate/models/message.dart';
import 'package:intl/intl.dart';

class ChatMessage extends StatelessWidget {
  ChatMessage({this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    final user = User.of(context);
    final textTheme = Theme.of(context).textTheme;
    final isMyMessage = user.id == message.identity;

    if (message.isBroadcast) {
      return Bubble(
          message: message.text,
          time: DateFormat.jm().format(message.date),
          delivered: true,
          isMe: false,
          isBroadcast: message.isBroadcast);
    } else {
      final avatar = Container(
        child: CircleAvatar(
          backgroundColor: message.colour,
          child: SvgPicture.network(message.image),
        ),
      );

      return ListTile(
        dense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 5),
        leading: isMyMessage ? null : avatar,
        trailing: isMyMessage ? avatar : null,
        title: Text(
          isMyMessage ? '${message.name} (you)' : message.name,
          style: textTheme.subhead.copyWith(fontWeight: FontWeight.bold),
          textAlign: isMyMessage ? TextAlign.right : TextAlign.left,
        ),
        subtitle: Bubble(
            message: message.text,
            time: DateFormat.jm().format(message.date),
            delivered: true,
            isMe: isMyMessage,
            isBroadcast: message.isBroadcast),
      );
    }
  }
}
