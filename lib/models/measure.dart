import 'package:json_annotation/json_annotation.dart';
// import 'package:json_serializable/json_serializable.dart';

part 'measure.g.dart';

@JsonSerializable()
class Measure {
  String? id;
  String? referenceId;
  String? targetId;
  num length = 0;
  num breadth = 0;
  num height = 0;
  num? numItems;
  num? currentValue;
  num? cumulativeValue;
  bool? isActive;
  String? comments;
  var documents;

  Measure(
      {this.id,
      this.referenceId,
      this.targetId,
      required this.length,
      required this.breadth,
      required this.height,
      this.numItems,
      this.currentValue,
      this.cumulativeValue,
      this.isActive,
      this.comments,
      this.documents = const [{}]});

  factory Measure.fromJson(Map<String, dynamic> json) =>
      _$MeasureFromJson(json);
  Map<String, dynamic> toJson() => _$MeasureToJson(this);
}
