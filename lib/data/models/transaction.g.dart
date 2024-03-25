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
      externalId: json['externalId'] as String?,
      walletKey: json['walletKey'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      paymentSystemTitle: json['paymentSystemTitle'] as String?,
      paymentSystemImage: json['paymentSystemImage'] as String?,
      paymentSystemNetwork: json['paymentSystemNetwork'] as String?,
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'status': instance.status,
      'type': instance.type,
      'amount': instance.amount,
      'walletKey': instance.walletKey,
      'externalId': instance.externalId,
      'user': instance.user.toJson(),
      'paymentSystemTitle': instance.paymentSystemTitle,
      'paymentSystemImage': instance.paymentSystemImage,
      'paymentSystemNetwork': instance.paymentSystemNetwork,
    };
