import 'package:flutter/material.dart';
import 'package:trainmate/models/trip_details.dart';
import 'package:trainmate/screens/train_occupancy.dart';
import 'package:trainmate/widgets/chat_stream.dart';
import 'package:trainmate/models/route_stop.dart';

import './timeline.dart';
import './stop.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key key, this.title, this.trip, this.destination}) : super(key: key);

  final String title;
  final RouteStop destination;
  final TripDetails trip;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: ChatScreen(trip: trip, destination: destination),
    );
  }
}

class ChatScreen extends StatelessWidget {
  ChatScreen({this.trip, this.destination});
  final TripDetails trip;
  final RouteStop destination;

  Widget _renderTimeline() => Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Timeline(stops: [
        Stop(stop: trip.stops.first, isCurrent: true),
        Stop(stop: destination, isCurrent: false),
      ]),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        _renderTimeline(),
        TrainOccupancyWidget(carriageOccupancy: trip?.occupancy ?? <int>[]),
        Divider(height: 1.0),
        Expanded(
          child: ChatStream(),
        ),
      ],
    );
  }
}
