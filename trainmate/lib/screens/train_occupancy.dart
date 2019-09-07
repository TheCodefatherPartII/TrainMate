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
                    color: getOccupancyColor(margin),
                    margin: EdgeInsets.only(
                        top: margin),
                    width: 30.0,
                  ));
            }));
  }

  Color getOccupancyColor(double margin) {
    if (margin < 5) {
      return Colors.red;
    } else if (margin > 5 && margin < 20.0) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }

  double topMargin(int occupancy) {
    return 30.0 - (((occupancy/5) * 100)/100) * 30;
  }
}
