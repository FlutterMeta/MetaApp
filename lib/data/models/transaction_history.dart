import 'package:json_annotation/json_annotation.dart';
import 'package:meta_app/data/models/transaction.dart';

part 'transaction_history.g.dart';

@JsonSerializable()
class TransactionHistory {
  final List<Transaction> transactions;

  const TransactionHistory({required this.transactions});

  TransactionHistory.empty() : transactions = [];

  factory TransactionHistory.fromJson(Map<String, dynamic> json) =>
      _$TransactionHistoryFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionHistoryToJson(this);
}
