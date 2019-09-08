import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  Message({
    this.identity,
    this.name,
    this.image,
    this.colour,
    this.text,
    this.date,
    this.isBroadcast = false,
  });

  String identity;
  String name;
  String image;
  @JsonKey(toJson: _colourToJson, fromJson: _colourFromJson)
  Color colour;
  String text;
  DateTime date;
  bool isBroadcast;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);

  static String _colourToJson(Color color) =>
      '#${color.value.toRadixString(16)}';
  static Color _colourFromJson(String color) =>
      Color(int.parse(color.replaceFirst('#', ''), radix: 16));
}
