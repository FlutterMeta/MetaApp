// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      id: json['id'] as int,
      date: json['date'] as String,
      status: json['status'] as String,
      type: json['type'] as String,
      amount: (json['amount'] as num).toDouble(),
      walletKey: json['walletKey'] as String,
      login: json['login'] as String,
      userId: json['userId'] as String,
      paymentSystemTitle: json['paymentSystemTitle'] as String,
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'status': instance.status,
      'type': instance.type,
      'amount': instance.amount,
      'walletKey': instance.walletKey,
      'login': instance.login,
      'userId': instance.userId,
      'paymentSystemTitle': instance.paymentSystemTitle,
    };
