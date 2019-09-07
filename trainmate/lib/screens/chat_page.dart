import 'package:flutter/material.dart';
import 'package:trainmate/screens/train_occupancy.dart';
import 'package:trainmate/widgets/chat_stream.dart';
import 'package:trainmate/models/route_stop.dart';

import 'timeline.dart';
import 'stop.dart';

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

  final List<Stop> dummyStationList = [
    new Stop(
      stop: new RouteStop(
          id: "dummy-id",
          name: "Burwood",
          arrivalTime: 1567849776 * 1000,
          delay: 0
      ),
      isCurrent: true,
    ),
    new Stop(
      stop: new RouteStop(
          id: "dummy-id",
          name: "Wynyard",
          arrivalTime: 1567849776 * 1000,
          delay: 0
      ),
      isCurrent: false,
    ),
  ];

  Widget _renderTimeline() => Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Timeline(stops: dummyStationList,)
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        TrainOccupancyWidget(),
        _renderTimeline(),
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
