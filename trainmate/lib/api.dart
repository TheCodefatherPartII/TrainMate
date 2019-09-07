import 'dart:convert';

import 'package:http/http.dart' as http;

import './models/models.dart';

Future<TripDetails> getTrip(String carId) async {
  final res = await http.get('https://zw19q95ckk.execute-api.ap-southeast-2.amazonaws.com/prod/');

  final allTrips = json.decode(res.body).map<TripDetails>((v) => TripDetails.fromJson(v)).toList();

  return allTrips.firstWhere((TripDetails t) => t.carriageIds.contains(carId ?? 'dne'), orElse: () => null);
}
