// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_system.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentSystem _$PaymentSystemFromJson(Map<String, dynamic> json) =>
    PaymentSystem(
      id: json['id'] as int,
      title: json['title'] as String,
      image: const Uint8ListConverter().fromJson(json['image'] as String?),
      enabled: json['enabled'] as bool? ?? true,
      key: json['key'] as String,
    );

Map<String, dynamic> _$PaymentSystemToJson(PaymentSystem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': const Uint8ListConverter().toJson(instance.image),
      'key': instance.key,
      'enabled': instance.enabled,
    };
