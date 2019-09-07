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
      routeDescription: json['routeDescription'] as String);
}

Map<String, dynamic> _$TripDetailsToJson(TripDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'carriageIDs': instance.carriageIds,
      'date': instance.date,
      'time': instance.time,
      'routeName': instance.routeName,
      'routeDescription': instance.routeDescription
    };
