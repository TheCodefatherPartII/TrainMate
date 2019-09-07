import 'package:flutter/material.dart';

import 'stop.dart';

class Timeline extends StatelessWidget {
  final List<Stop> stops;

  Timeline({@required this.stops});

  @override
  Widget build(BuildContext context) {
    int timeDiff =
        stops.last.stop.arrivalTime.difference(DateTime.now()).inMinutes;
    String timeDisplay = timeDiff < 0
        ? "Missed your stop? Get off now!"
        : timeDiff < 3
            ? "Arriving now, move towards the carriage door."
            : "Arriving in $timeDiff mins";

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: <Widget>[
          stops.first,
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius:
                    BorderRadius.horizontal(right: Radius.elliptical(16, 4)),
              ),
              height: 5.0,
              margin: EdgeInsets.symmetric(horizontal: 5),
            ),
          ),
          stops.last,
          Spacer(),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 200),
            child: Text(
              timeDisplay,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
