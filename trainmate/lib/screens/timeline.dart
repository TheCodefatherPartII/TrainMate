import 'package:flutter/material.dart';

import 'station.dart';

class Timeline extends StatelessWidget {

  final List<Stop> stops;

  Timeline({@required this.stops});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        stops[0],
        spacer(),
        line(),
        spacer(),
        stops[1],
        new Expanded(
            child: Text("Next Stop")
        ),
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
      width: 60.0,
    );
  }
}