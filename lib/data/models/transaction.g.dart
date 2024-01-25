// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      network: json['network'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      amount: (json['amount'] as num).toDouble(),
      date: json['date'] as String,
      status: json['status'] as String,
      note: json['note'] as String,
      destinationAddress: json['destinationAddress'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'network': instance.network,
      'amount': instance.amount,
      'date': instance.date,
      'status': instance.status,
      'type': instance.type,
      'note': instance.note,
      'destinationAddress': instance.destinationAddress,
      'user': instance.user,
    };
