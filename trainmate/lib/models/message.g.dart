// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
      identity: json['identity'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      colour: json['colour'] == null
          ? null
          : Message._colourFromJson(json['colour'] as String),
      text: json['text'] as String,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      isBroadcast: json['isBroadcast'] as bool);
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'identity': instance.identity,
      'name': instance.name,
      'image': instance.image,
      'colour': instance.colour == null
          ? null
          : Message._colourToJson(instance.colour),
      'text': instance.text,
      'date': instance.date?.toIso8601String(),
      'isBroadcast': instance.isBroadcast
    };
