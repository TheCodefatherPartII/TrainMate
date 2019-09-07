import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trainmate/models/route_stop.dart';

import './models/models.dart';

Future<TripDetails> getTrip(String carId) async {
  final res = await http.get('https://zw19q95ckk.execute-api.ap-southeast-2.amazonaws.com/prod/');

  final allTrips = json.decode(res.body).map<TripDetails>((v) => TripDetails.fromJson(v)).toList();

  final myTrip = allTrips.firstWhere((TripDetails t) => t.carriageIds.contains(carId ?? 'dne'), orElse: () => null);

  myTrip.stops = [
    RouteStop(
      id: 'asd1',
      name: 'Parramatta Station',
      arrivalTime: 1567979190,
    ),
    RouteStop(
      id: 'asd2',
      name: 'Strathfield Station',
      arrivalTime: 1567979190,
    ),
    RouteStop(
      id: 'asd3',
      name: 'Redfern Station',
    ),
    RouteStop(
      id: 'asd4',
      name: 'Central Station',
    ),
    RouteStop(
      id: 'asd5',
      name: 'Town Hall Station',
    ),
    RouteStop(
      id: 'asd6',
      name: 'Wynyard Station',
    ),
  ];

  return myTrip;
}
