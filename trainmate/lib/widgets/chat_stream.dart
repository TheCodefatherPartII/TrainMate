import 'package:flutter/material.dart';
import 'package:trainmate/screens/chat_message.dart';
import 'package:trainmate/user.dart';

class ChatStream extends StatefulWidget {
  @override
  _ChatStreamState createState() => _ChatStreamState();
}

class _ChatStreamState extends State<ChatStream> {
  final _chatController = TextEditingController();
  final _messages = <Widget>[
    ChatMessage(
      identity: 'adas',
      name: 'Humorous Fox',
      text: 'Does anyone know a good coffee place near Strathfield?',
      date: DateTime.now().subtract(Duration(minutes: 5)),
    ),
    ChatMessage(
      identity: '234435',
      name: 'Fuzzy Hammer',
      text: 'Have you tried the 7eleven? 😛',
      date: DateTime.now().subtract(Duration(minutes: 3)),
    ),
  ];

  void _handleSubmit() {
    final user = User.of(context);
    final value = _chatController.text;

    _chatController.clear();

    ChatMessage message = ChatMessage(
      identity: user.id,
      name: user.name,
      text: value,
      date: DateTime.now(),
    );

    setState(() {
      _messages.add(message);
    });
  }

  @override
  Widget build(BuildContext context) {
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
                Flexible(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: "Start typing ...",
                    ),
                    controller: _chatController,
                    onSubmitted: (v) => _handleSubmit(),
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
