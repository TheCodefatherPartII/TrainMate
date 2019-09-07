// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trip _$TripFromJson(Map<String, dynamic> json) {
  return Trip()
    ..id = json['id'] as String
    ..routeName = json['routeName'] as String;
}

Map<String, dynamic> _$TripToJson(Trip instance) =>
    <String, dynamic>{'id': instance.id, 'routeName': instance.routeName};
