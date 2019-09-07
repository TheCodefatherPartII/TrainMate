import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trainmate/user.dart';

class ChatMessage extends StatelessWidget {
  final String identity;
  final String name;
  final String image;
  final Color colour;
  final String text;
  final DateTime date;

  // constructor to get text from textfield
  ChatMessage({
    this.identity,
    this.name,
    this.image,
    this.colour,
    this.text,
    this.date,
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

    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 5),
      leading: isMyMessage ? null : avatar,
      trailing: isMyMessage ? avatar : null,
      title: Text(
        isMyMessage ? '${this.name} (you)' : this.name,
        style: textTheme.subhead.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        this.text,
        style: textTheme.subhead,
      ),
    );
  }
}
