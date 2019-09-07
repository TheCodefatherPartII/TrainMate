import 'package:flutter/material.dart';

class TrainOccupancyWidget extends StatelessWidget {
  TrainOccupancyWidget({this.carriageOccupancy});

  final List<int> carriageOccupancy;

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.only(bottom: 10.0, top: 10.0),
        height: 20.0,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: carriageOccupancy.length,
            itemBuilder: (BuildContext ctxt, int index) {
              double margin = topMargin(carriageOccupancy[index]);
              return Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 0.2, color: Colors.grey),
                      left: BorderSide(width: 0.2, color: Colors.grey),
                      right: BorderSide(width: 0.2, color: Colors.grey),
                      bottom: BorderSide(width: 0.2, color: Colors.grey),
                    ),
                  ),
                  child: Container(
                    color: getOccupancyColor(carriageOccupancy[index]),
                    margin: EdgeInsets.only(top: margin),
                    width: 30.0,
                  ));
            }));
  }

  Color getOccupancyColor(int occupancy) {
    switch (occupancy) {
      case 5:
        return Colors.red;
      case 4:
        return Colors.deepOrangeAccent;
      case 3:
        return Colors.orangeAccent;
      case 2:
        return Colors.lightGreen;
      default:
        return Colors.green.shade700;
    }
  }

  double topMargin(int occupancy) {
    switch (occupancy) {
      case 1:
        return 15.0;
      case 2: return 12.0;
      case 3: return 8.0;
      case 4: return 4.0;
      default: return 0.0;
    }
  }
}
