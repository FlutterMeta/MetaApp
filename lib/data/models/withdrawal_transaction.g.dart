// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdrawal_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WithdrawalTransaction _$WithdrawalTransactionFromJson(
        Map<String, dynamic> json) =>
    WithdrawalTransaction(
      sum: (json['sum'] as num).toDouble(),
      network: json['network'] as String,
      walletKey: json['walletKey'] as String,
    );

Map<String, dynamic> _$WithdrawalTransactionToJson(
        WithdrawalTransaction instance) =>
    <String, dynamic>{
      'sum': instance.sum,
      'walletKey': instance.walletKey,
      'network': instance.network,
    };
