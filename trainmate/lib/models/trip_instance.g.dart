// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_instance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripInstance _$TripInstanceFromJson(Map<String, dynamic> json) {
  return TripInstance()
    ..startDate = json['startDate'] as String
    ..instanceNumber = json['instanceNumber'] as int
    ..realtimeState = json['realtimeState'] as String
    ..realtimeStatus = json['realtimeStatus'] as int
    ..routeVariantKey = json['routeVariantKey'] as String
    ..tripContinues = json['tripContinues'] as bool
    ..shapeId = json['shapeId'] as String
    ..time = json['time'] as int
    ..current = json['current'] as bool
    ..trip = json['trip'];
}

Map<String, dynamic> _$TripInstanceToJson(TripInstance instance) =>
    <String, dynamic>{
      'startDate': instance.startDate,
      'instanceNumber': instance.instanceNumber,
      'realtimeState': instance.realtimeState,
      'realtimeStatus': instance.realtimeStatus,
      'routeVariantKey': instance.routeVariantKey,
      'tripContinues': instance.tripContinues,
      'shapeId': instance.shapeId,
      'time': instance.time,
      'current': instance.current,
      'trip': instance.trip
    };
