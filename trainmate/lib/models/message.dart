import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message.g.part';

@JsonSerializable()
class Message {
  Message({
    this.identity,
    this.name,
    this.image,
    this.colour,
    this.text,
    this.date,
    this.isBroadcast,
  });

  String identity;
  String name;
  String image;
  Color colour;
  String text;
  DateTime date;
  bool isBroadcast;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this); 

}