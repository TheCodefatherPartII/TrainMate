import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trainmate/api/firebase.dart';
import 'package:trainmate/screens/chat_message.dart';
import 'package:trainmate/user.dart';
import 'package:trainmate/models/message.dart';

class ChatStream extends StatefulWidget {
  ChatStream({this.tripId});
  final String tripId;

  @override
  _ChatStreamState createState() => _ChatStreamState();
}

class _ChatStreamState extends State<ChatStream> {
  final _chatController = TextEditingController();

  void _handleSubmit() {
    final value = _chatController.text;
    if (value?.isEmpty ?? true) return;

    final user = User.of(context);

    _chatController.clear();

    sendMessage(
      widget.tripId,
      Message(
        identity: user.id,
        name: user.name,
        image: user.image,
        colour: user.colour,
        text: value,
        date: DateTime.now(),
      ),
    );
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
              child: StreamBuilder<List<Message>>(
                stream: getMessages(widget.tripId),
                initialData: [],
                builder: (ctx, snapshots) {
                  return ListView.builder(
                    itemCount: snapshots.data?.length,
                    itemBuilder: (ctx, index) {
                      if (snapshots.data?.isEmpty ?? true) {
                        return null;
                      }

                      return ChatMessage(message: snapshots.data[index]);
                    },
                  );
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
