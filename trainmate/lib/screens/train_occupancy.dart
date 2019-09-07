import 'package:flutter/material.dart';

class TrainOccupancyWidget extends StatelessWidget {
  int currentCarriage = 1;
  List<double> carriageOccupancy = new List();

  TrainOccupancyWidget() {
    carriageOccupancy.add(1.0);
    carriageOccupancy.add(3.0);
    carriageOccupancy.add(5.0);
    carriageOccupancy.add(2.0);
    carriageOccupancy.add(2.0);
    carriageOccupancy.add(5.0);
    carriageOccupancy.add(3.0);
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.only(bottom: 10.0, top: 10.0),
        height: 30.0,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: carriageOccupancy.length,
            itemBuilder: (BuildContext ctxt, int index) {
              double margin = topMargin(carriageOccupancy.elementAt(index));
              return Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 0.2, color: Colors.deepOrangeAccent),
                      left: BorderSide(width: 0.2, color: Colors.deepOrangeAccent),
                      right: BorderSide(width: 0.2, color: Colors.deepOrangeAccent),
                      bottom: BorderSide(width: 0.2, color: Colors.deepOrangeAccent),
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
    if (margin == 0) {
      return Colors.red;
    } else if (margin > 0 && margin < 20.0) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }

  double topMargin(double occupancy) {
    return 30.0 - (((occupancy/5) * 100)/100) * 30;
  }
}
