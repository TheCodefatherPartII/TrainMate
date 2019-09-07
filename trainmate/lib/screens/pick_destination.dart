import 'package:code_input/code_input.dart';

import 'package:flutter/material.dart';
import 'package:trainmate/api.dart';
import 'package:trainmate/models/models.dart';

class PickDestinationPage extends StatefulWidget {
  final int carriageId;

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
    this.trip = await getTrip(this.widget.carriageId);

    setState(() {
      loading = false;
    });
  }

//  _goToChatPage() async {
//    final trip = await getTrip(_carriageController.text?.trim());
//
//    Navigator.push(
//      context,
//      MaterialPageRoute(
//          builder: (context) => ChatPage(title: trip?.routeDescription)),
//    );
//  }

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
