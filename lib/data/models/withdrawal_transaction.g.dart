// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdrawal_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WithdrawalTransaction _$WithdrawalTransactionFromJson(
        Map<String, dynamic> json) =>
    WithdrawalTransaction(
      sum: (json['sum'] as num).toDouble(),
      paymentSystemId: json['paymentSystemId'] as int,
      walletKey: json['walletKey'] as String,
    );

Map<String, dynamic> _$WithdrawalTransactionToJson(
        WithdrawalTransaction instance) =>
    <String, dynamic>{
      'sum': instance.sum,
      'walletKey': instance.walletKey,
      'paymentSystemId': instance.paymentSystemId,
    };
