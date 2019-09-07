// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_stop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RouteStop _$RouteStopFromJson(Map<String, dynamic> json) {
  return RouteStop(
      id: json['id'] as String,
      name: json['name'] as String,
      arrivalTime: DateTime.fromMicrosecondsSinceEpoch(json['arrivalTime'] as int),
      delay: json['delay'] as int);
}

Map<String, dynamic> _$RouteStopToJson(RouteStop instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'arrivalTime': instance.arrivalTime,
      'delay': instance.delay
    };
