// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_transactions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PendingTransactions _$PendingTransactionsFromJson(Map<String, dynamic> json) =>
    PendingTransactions(
      transactions: (json['transactions'] as List<dynamic>)
          .map((e) => Transaction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PendingTransactionsToJson(
        PendingTransactions instance) =>
    <String, dynamic>{
      'transactions': instance.transactions,
    };
