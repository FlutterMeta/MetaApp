// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      key: json['key'] as String?,
      login: json['login'] as String,
      email: json['email'] as String,
      level: json['level'] as int,
      phoneNumber: json['phoneNumber'] as String,
      balance: (json['balance'] as num).toDouble(),
      transactions: (json['transactions'] as List<dynamic>?)
          ?.map((e) => Transaction.fromJson(e as Map<String, dynamic>))
          .toList(),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'login': instance.login,
      'email': instance.email,
      'level': instance.level,
      'phoneNumber': instance.phoneNumber,
      'balance': instance.balance,
      'transactions': instance.transactions,
      'products': instance.products,
    };
