// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_stop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RouteStop _$RouteStopFromJson(Map<String, dynamic> json) {
  return RouteStop(
      id: json['id'] as String,
      name: json['name'] as String,
      arrivalTime: json['time'] == null
          ? null
          : RouteStop._convertTime(json['time'] as String),
      delay: json['delay'] as int);
}

Map<String, dynamic> _$RouteStopToJson(RouteStop instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'time': instance.arrivalTime?.toIso8601String(),
      'delay': instance.delay
    };
