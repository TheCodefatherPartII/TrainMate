import 'package:flutter/material.dart';
import 'package:trainmate/models/trip_details.dart';
import 'package:trainmate/screens/train_occupancy.dart';
import 'package:trainmate/widgets/chat_stream.dart';

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
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        TrainOccupancyWidget(carriageOccupancy: trip?.occupancy ?? <int>[]),
        Divider(height: 1.0),
        Expanded(
          child: ChatStream(),
        ),
      ],
    );
  }
}
