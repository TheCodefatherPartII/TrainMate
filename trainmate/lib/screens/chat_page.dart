import 'package:flutter/material.dart';
import 'package:trainmate/screens/train_occupancy.dart';
import 'package:trainmate/widgets/chat_stream.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        TrainOccupancyWidget(),
        Divider(
          height: 1.0,
        ),
        Expanded(
          child: ChatStream(),
        ),
      ],
    );
  }
}
