import 'package:flutter/material.dart';
import 'package:trainmate/models/trip_details.dart';
import 'package:trainmate/screens/train_occupancy.dart';
import 'package:trainmate/widgets/chat_stream.dart';
import 'package:trainmate/models/route_stop.dart';

import './timeline.dart';
import './stop.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key key, this.title, this.trip}) : super(key: key);

  final String title;
  final TripDetails trip;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: ChatScreen(trip: trip),
    );
  }
}

class ChatScreen extends StatelessWidget {
  ChatScreen({this.trip});
  final TripDetails trip;

  
  final List<Stop> dummyStationList = [
    new Stop(
      stop: new RouteStop(
          id: "dummy-id",
          name: "Burwood",
          arrivalTime: DateTime.now(),
          delay: 0
      ),
      isCurrent: true,
    ),
    new Stop(
      stop: new RouteStop(
          id: "dummy-id2",
          name: "Wynyard",
          arrivalTime: DateTime.now().add(new Duration(minutes: 18)),
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
        TrainOccupancyWidget(carriageOccupancy: trip?.occupancy ?? <int>[]),
        _renderTimeline(),
        Divider(height: 1.0),
        Expanded(
          child: ChatStream(),
        ),
      ],
    );
  }
}
