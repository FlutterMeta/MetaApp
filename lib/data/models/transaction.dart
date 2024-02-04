import 'package:json_annotation/json_annotation.dart';
import 'package:meta_app/data/models/user.dart';

part 'transaction.g.dart';

@JsonSerializable(explicitToJson: true)
class Transaction {
  final int id;
  final String date;
  final String status;
  final String type;
  final double amount;
  final String walletKey;

  final User user;
  final String paymentSystemTitle;

  Transaction({
    required this.id,
    required this.date,
    required this.status,
    required this.type,
    required this.amount,
    required this.walletKey,
    required this.user,
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
