import 'package:flutter/material.dart';
import 'dart:math';

class DriverCarriage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(15)),
        color: Colors.grey,
      ),
      width: 30,
      margin: EdgeInsets.only(left: 1),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(10)),
            color: Color.fromRGBO(20, 70, 180, 0.7),
          ),
          margin: EdgeInsets.only(left: 10, right: 4, top: 4, bottom: 6)),
    );
  }
}

class TrainOccupancyWidget extends StatelessWidget {
  TrainOccupancyWidget({this.carriageOccupancy, this.activeCarriage = 2});

  final List<int> carriageOccupancy;
  final int activeCarriage;

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(bottom: 10.0, top: 10.0, left: 20),
      height: 25.0,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: carriageOccupancy.length + 1,
        itemBuilder: (BuildContext ctxt, int index) {
          if (index == carriageOccupancy.length) {
            return DriverCarriage();
          }

          final isActive = activeCarriage == index;
          double margin =
              max(topMargin(carriageOccupancy[index]) - (isActive ? 2 : 0), 0);

          return Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              border: isActive
                  ? Border.all(width: 3, color: Theme.of(context).accentColor)
                  : null,
            ),
            margin: EdgeInsets.symmetric(horizontal: 2),
            child: Container(
              color: getOccupancyColor(carriageOccupancy[index]),
              margin: EdgeInsets.only(top: margin),
            ),
            width: 38.0,
          );
        },
      ),
    );
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
      case 2:
        return 12.0;
      case 3:
        return 8.0;
      case 4:
        return 4.0;
      default:
        return 0.0;
    }
  }
}
