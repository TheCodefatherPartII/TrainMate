import 'package:json_annotation/json_annotation.dart';

part 'trip_details.g.dart';

@JsonSerializable()
class TripDetails {
  TripDetails({
    this.id,
    this.carriageIds,
    this.date,
    this.time,
    this.routeName,
    this.routeDescription,
  });

  String id;
  @JsonKey(name: 'carriageIDs')
  List<String> carriageIds;
  String date;
  int time;
  String routeName;
  String routeDescription;

  factory TripDetails.fromJson(Map<String, dynamic> json) => _$TripDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$TripDetailsToJson(this); 
}