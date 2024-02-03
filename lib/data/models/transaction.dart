import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction {
  final int id;
  final String date;
  final String status;
  final String type;
  final double amount;
  final String walletKey;

  final String login;
  final String userId;
  final String paymentSystemTitle;

  Transaction({
    required this.id,
    required this.date,
    required this.status,
    required this.type,
    required this.amount,
    required this.walletKey,
    required this.login,
    required this.userId,
    required this.paymentSystemTitle,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}

enum TransactionStatus {
  completed,
  pending,
  canceled;
}
