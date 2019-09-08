import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:trainmate/models/route_stop.dart';

import '../models/models.dart';

final _random = new Random();
int next(int min, int max) => min + _random.nextInt(max - min);

Future<TripDetails> getTrip(String carriageId) async {
  final res = await http
      .get('https://zw19q95ckk.execute-api.ap-southeast-2.amazonaws.com/prod/');

  final jsonResult = json.decode(res.body);

  List<TripDetails> allTrips =
      jsonResult.map<TripDetails>((v) => TripDetails.fromJson(v)).toList();

  // final myTrip = allTrips.firstWhere((TripDetails t) => t.carriageIds.contains(carId ?? 'dne'), orElse: () => null);
  final myTrip = allTrips.isNotEmpty ? allTrips.first : TripDetails();
  myTrip.occupancy = myTrip.occupancy ?? <int>[1, 2, 3, 5, 2, 4, 1, 1];

  var now = DateTime.now();
  DateTime nextTime() {
    now = now.add(new Duration(minutes: next(5, 10)));
    return now;
  }

  if (myTrip.stops?.isEmpty ?? true) {
    myTrip.stops = [
      RouteStop(
        id: 'asd1',
        name: 'Parramatta Station',
        arrivalTime: nextTime(),
      ),
      RouteStop(
        id: 'asd2',
        name: 'Strathfield Station',
        arrivalTime: nextTime(),
      ),
      RouteStop(
        id: 'asd3',
        name: 'Redfern Station',
        arrivalTime: nextTime(),
      ),
      RouteStop(
        id: 'asd4',
        name: 'Central Station',
        arrivalTime: nextTime(),
      ),
      RouteStop(
        id: 'asd5',
        name: 'Town Hall Station',
        arrivalTime: nextTime(),
      ),
      RouteStop(
        id: 'asd6',
        name: 'Wynyard Station',
        arrivalTime: nextTime(),
      ),
    ];
  }

  myTrip.stops?.forEach((s) {
    s.name = s.name.replaceAll(RegExp(r' Station.+'), '');
    // s.arrivalTime.add(Duration(microseconds: DateTime(2019, 9, 8).microsecondsSinceEpoch));
  });
  final nowMins = DateTime.now().subtract(Duration(seconds: 10));
  myTrip.stops = myTrip.stops
      .where((s) => s.arrivalTime.isAfter(nowMins)).toList();
  
  myTrip.stops.sort((s1, s2) => s1.arrivalTime.compareTo(s2.arrivalTime));

  return myTrip;
}
