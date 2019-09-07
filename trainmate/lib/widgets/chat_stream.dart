import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trainmate/screens/chat_message.dart';
import 'package:trainmate/user.dart';

final fakeUsers = [
  User('asdasd'),
  User('kjhiofsufg'),
];

class ChatStream extends StatefulWidget {
  @override
  _ChatStreamState createState() => _ChatStreamState();
}

class _ChatStreamState extends State<ChatStream> {
  final _chatController = TextEditingController();
  final _messages = <Widget>[
    ChatMessage(
      identity: fakeUsers[0].id,
      name: fakeUsers[0].name,
      image: fakeUsers[0].image,
      colour: fakeUsers[0].colour,
      text: 'Does anyone know a good coffee place near Strathfield?',
      date: DateTime.now().subtract(Duration(minutes: 5)),
    ),
    ChatMessage(
      identity: fakeUsers[1].id,
      name: fakeUsers[1].name,
      image: fakeUsers[1].image,
      colour: fakeUsers[1].colour,
      text: 'Have you tried the 7eleven? 😛',
      date: DateTime.now().subtract(Duration(minutes: 3)),
    ),
  ];

  void _handleSubmit() {
    final value = _chatController.text;
    if (value?.isEmpty ?? true) return;

    final user = User.of(context);

    _chatController.clear();

    ChatMessage message = ChatMessage(
      identity: user.id,
      name: user.name,
      image: user.image,
      colour: user.colour,
      text: value,
      date: DateTime.now(),
    );

    setState(() {
      _messages.add(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = User.of(context);

    return IconTheme(
      data: IconThemeData(color: Colors.blue),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (ctx, index) {
                  return _messages[index];
                },
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  child: CircleAvatar(
                    backgroundColor: user.colour,
                    child: SvgPicture.network(user.image),
                  ),
                  margin: EdgeInsets.only(right: 8),
                ),
                Flexible(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: "Start typing ...",
                    ),
                    controller: _chatController,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: _handleSubmit,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
