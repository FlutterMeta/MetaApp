// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      subscriptionDuration: json['subscriptionDuration'] as int,
      subscriptionTier:
          $enumDecode(_$SubscriptionTierEnumMap, json['subscriptionTier']),
      users: (json['users'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'subscriptionDuration': instance.subscriptionDuration,
      'subscriptionTier': _$SubscriptionTierEnumMap[instance.subscriptionTier]!,
      'users': instance.users.map((e) => e.toJson()).toList(),
    };

const _$SubscriptionTierEnumMap = {
  SubscriptionTier.basic: 'basic',
  SubscriptionTier.advanced: 'advanced',
  SubscriptionTier.professional: 'professional',
};
