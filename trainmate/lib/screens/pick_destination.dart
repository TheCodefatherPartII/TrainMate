import 'package:code_input/code_input.dart';

import 'package:flutter/material.dart';
import 'package:trainmate/api.dart';
import 'package:trainmate/models/models.dart';

class PickDestinationPage extends StatefulWidget {
  final String carriageId;

  PickDestinationPage({Key key, this.carriageId}) : super(key: key);

  @override
  _PickDestinationPageState createState() => _PickDestinationPageState();
}

class _PickDestinationPageState extends State<PickDestinationPage> {
  TripDetails trip;

  bool loading = true;

  @override
  void initState() {
    super.initState();

    getTripDetails();
  }

  void getTripDetails() async {
    final res = await getTrip(widget.carriageId);

    setState(() {
      loading = false;
      trip = res;
    });

    Navigator.of(context)
        .pushNamed('/chat', arguments: {'title': res?.routeName, 'trip': res});
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Loading", style: TextStyle(fontSize: 12)),
            ),
          ],
        ),
      ));
    }

    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("Need Help?", style: TextStyle(fontSize: 12)),
          ),
        ],
      ),
    ));
  }
}
