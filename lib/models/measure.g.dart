// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Measure _$MeasureFromJson(Map<String, dynamic> json) => Measure(
      id: json['id'] as String?,
      referenceId: json['referenceId'] as String?,
      targetId: json['targetId'] as String?,
      length: json['length'] as num,
      breadth: json['breadth'] as num,
      height: json['height'] as num,
      numItems: json['numItems'] as num?,
      currentValue: json['currentValue'] as num?,
      cumulativeValue: json['cumulativeValue'] as num?,
      isActive: json['isActive'] as bool?,
      comments: json['comments'] as String?,
      documents: json['documents'] ?? const [{}],
    );

Map<String, dynamic> _$MeasureToJson(Measure instance) => <String, dynamic>{
      'id': instance.id,
      'referenceId': instance.referenceId,
      'targetId': instance.targetId,
      'length': instance.length,
      'breadth': instance.breadth,
      'height': instance.height,
      'numItems': instance.numItems,
      'currentValue': instance.currentValue,
      'cumulativeValue': instance.cumulativeValue,
      'isActive': instance.isActive,
      'comments': instance.comments,
      'documents': instance.documents,
    };
