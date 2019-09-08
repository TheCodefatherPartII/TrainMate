import 'package:flutter/material.dart';
import 'package:trainmate/models/route_stop.dart';

class Stop extends StatelessWidget {
  final RouteStop stop;
  final bool isCurrent;

  Stop({this.stop, this.isCurrent});

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        this.isCurrent
            ? Icon(Icons.train, color: Theme.of(context).primaryColor)
            : Icon(Icons.flag, color: Theme.of(context).primaryColor),
        Text(
            stop.name.replaceAll(RegExp(r' station', caseSensitive: false), ''))
      ],
    );
  }
}
