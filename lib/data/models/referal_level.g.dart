// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referal_level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReferalLevel _$ReferalLevelFromJson(Map<String, dynamic> json) => ReferalLevel(
      id: json['id'] as int,
      level: json['level'] as int,
      reward: (json['reward'] as num).toDouble(),
      requiredReferalsCount: json['requiredReferalsCount'] as int,
    );

Map<String, dynamic> _$ReferalLevelToJson(ReferalLevel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'level': instance.level,
      'reward': instance.reward,
      'requiredReferalsCount': instance.requiredReferalsCount,
    };
