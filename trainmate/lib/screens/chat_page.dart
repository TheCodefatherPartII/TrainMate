import 'package:flutter/material.dart';
import 'package:trainmate/models/route_stop.dart';
import 'package:trainmate/screens/chat_message.dart';
import 'package:trainmate/screens/train_occupancy.dart';

import 'timeline.dart';
import 'station.dart';

class ChatPage extends StatelessWidget {

  ChatPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(this.title),
        ),
        body: new ChatScreen()
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  State createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _chatController = new TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];

  final String identity = "anonymouse-id-from-firebase";
  final List<Stop> dummyStationList = [
    new Stop(
      stop: new RouteStop(
          id: "dummy-id",
          name: "Burwood",
          arrivalTime: 1567849776,
          delay: 0
      ),
      isCurrent: true,
    ),
    new Stop(
      stop: new RouteStop(
          id: "dummy-id",
          name: "Wynyard",
          arrivalTime: 1567899776,
          delay: 0
      ),
      isCurrent: false,
    ),
  ];

  void _handleSubmit(String text) {
    _chatController.clear();

    ChatMessage message = new ChatMessage(
        identity: identity,
        text: text
    );

    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget _chatEnvironment (){
    return IconTheme(
      data: new IconThemeData(color: Colors.blue),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal:8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                decoration: new InputDecoration.collapsed(hintText: "Start typing ..."),
                controller: _chatController,
                onSubmitted: _handleSubmit,
              ),
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                icon: new Icon(Icons.send),

                onPressed: ()=> _handleSubmit(_chatController.text),

              ),
            )
          ],
        ),

      ),
    );
  }

  Widget _renderTimeline() => Container(
    margin: EdgeInsets.only(top: 10, bottom: 10),
    child: Timeline(stops: dummyStationList,)
  );

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        TrainOccupancyWidget(),
        _renderTimeline(),
        new Flexible(
          child: ListView.builder(
            padding: new EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_, int index) => _messages[index],
            itemCount: _messages.length,
          ),
        ),
        new Divider(
          height: 1.0,
        ),
        new Container(decoration: new BoxDecoration(
          color: Theme.of(context).cardColor,
        ),
          child: _chatEnvironment(),
        ),
      ],
    );
  }
}