// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measurement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Measurement _$MeasurementFromJson(Map<String, dynamic> json) => Measurement(
      id: json['id'] as String?,
      referenceId: json['referenceId'] as String?,
      tenantId: json['tenantId'] as String?,
      measurementNumber: json['measurementNumber'] as String?,
      physicalRefNumber: json['physicalRefNumber'] as String?,
      isActive: json['isActive'] as bool?,
      measures: (json['measures'] as List<dynamic>?)
          ?.map((e) => Measure.fromJson(e as Map<String, dynamic>))
          .toList(),
      entryDate: json['entryDate'] as num? ?? 0,
      documents: json['documents'] ?? const [{}],
    );

Map<String, dynamic> _$MeasurementToJson(Measurement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenantId': instance.tenantId,
      'measurementNumber': instance.measurementNumber,
      'referenceId': instance.referenceId,
      'isActive': instance.isActive,
      'physicalRefNumber': instance.physicalRefNumber,
      'measures': instance.measures?.map((e) => e.toJson()).toList(),
      'entryDate': instance.entryDate,
      'documents': instance.documents,
    };
