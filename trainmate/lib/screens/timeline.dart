import 'dart:async';
import 'package:flutter/material.dart';

import 'stop.dart';

class Timeline extends StatefulWidget {
  final List<Stop> stops;

  Timeline({@required this.stops});

  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  int timeDiff = 0;
  
  @override
  void initState() {
    super.initState();

    timeDiff =
        widget.stops.last.stop.arrivalTime.difference(DateTime.now()).inMinutes;
    
    Timer.periodic(Duration(seconds: 5), (Timer t) => setState(() {
      timeDiff =
        widget.stops.last.stop.arrivalTime.difference(DateTime.now()).inMinutes;
    }));

  }

  @override
  Widget build(BuildContext context) {
    String timeDisplay = timeDiff < 0
        ? "Missed your stop? Get off now!"
        : timeDiff < 3
            ? "Arriving now, move towards the carriage door."
            : "Arriving in $timeDiff mins";

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: <Widget>[
          widget.stops.first,
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
          widget.stops.last,
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
