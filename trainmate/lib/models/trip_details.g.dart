// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripDetails _$TripDetailsFromJson(Map<String, dynamic> json) {
  return TripDetails(
      id: json['id'] as String,
      carriageIds:
          (json['carriageIDs'] as List)?.map((e) => e as String)?.toList(),
      date: json['date'] as String,
      time: json['time'] as int,
      routeName: json['routeName'] as String,
      routeDescription: json['routeDescription'] as String,
      occupancy: (json['occupancy'] as List)?.map((e) => e as int)?.toList())
    ..stops = (json['stops'] as List)
        ?.map((e) =>
            e == null ? null : RouteStop.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$TripDetailsToJson(TripDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'carriageIDs': instance.carriageIds,
      'date': instance.date,
      'time': instance.time,
      'routeName': instance.routeName,
      'routeDescription': instance.routeDescription,
      'occupancy': instance.occupancy,
      'stops': instance.stops?.map((e) => e?.toJson())?.toList()
    };
