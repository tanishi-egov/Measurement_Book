import 'package:json_annotation/json_annotation.dart';
// import 'package:json_serializable/json_serializable.dart';
import 'package:measurement_book_ui/models/measure.dart';

part 'measurement.g.dart';

@JsonSerializable(explicitToJson: true)
class Measurement {
  String? id;
  String? tenantId;
  String? measurementNumber;
  String? referenceId;
  bool? isActive;
  String? physicalRefNumber;
  List<Measure>? measures;
  num entryDate;
  var documents;

  Measurement(
      {this.id,
      this.referenceId,
      this.tenantId,
      this.measurementNumber,
      this.physicalRefNumber,
      this.isActive,
      this.measures,
      this.entryDate = 0,
      this.documents = const [{}]});

  factory Measurement.fromJson(Map<String, dynamic> json) =>
      _$MeasurementFromJson(json);
  Map<String, dynamic> toJson() => _$MeasurementToJson(this);
}
