import 'package:json_annotation/json_annotation.dart';

part 'trip_instance.g.dart';

@JsonSerializable()
class TripInstance {
  String startDate;
  int instanceNumber;
  String realtimeState;
  int realtimeStatus;
  String routeVariantKey;
  bool tripContinues;
  String shapeId;
  int time;
  bool current;

  Trip trip;
}
