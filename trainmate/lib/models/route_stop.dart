import 'package:json_annotation/json_annotation.dart';

part 'route_stop.g.dart';

@JsonSerializable()
class RouteStop {
  RouteStop({
    this.id,
    this.name,
    this.arrivalTime,
    this.delay,
  });

  String id;
  String name;
  DateTime arrivalTime;
  int delay;

  factory RouteStop.fromJson(Map<String, dynamic> json) =>
      _$RouteStopFromJson(json);
  Map<String, dynamic> toJson() => _$RouteStopToJson(this);
}
