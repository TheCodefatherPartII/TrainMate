import 'package:flutter/material.dart';

import 'stop.dart';

class Timeline extends StatelessWidget {

  final List<Stop> stops;

  Timeline({@required this.stops});

  @override
  Widget build(BuildContext context) {

    int timeDiff = stops.last.stop.arrivalTime.difference(DateTime.now()).inMinutes;
    String timeDisplay = timeDiff < 0 ? "Missed your stop? Get off now!" : timeDiff < 3 ? "Arriving now, move towards the carrige door." : "Arriving in $timeDiff m.";

    return  Row(
      children: <Widget>[
        stops[0],
        spacer(),
        line(),
        spacer(),
        stops.last,
        Spacer(),
        Text(timeDisplay),
      ],
    );
  }

  Widget spacer() {
    return Container(
      width: 6.0,
    );
  }

  Widget line() {
    return Container(
      color: Colors.black,
      height: 5.0,
      width: 120.0,
    );
  }
}