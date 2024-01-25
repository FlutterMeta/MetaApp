import 'package:json_annotation/json_annotation.dart';
import 'package:meta_app/data/models/transaction.dart';

part 'pending_transactions.g.dart';

@JsonSerializable()
class PendingTransactions {
  final List<Transaction> transactions;

  const PendingTransactions({required this.transactions});

  PendingTransactions.empty() : transactions = [];

  factory PendingTransactions.fromJson(Map<String, dynamic> json) =>
      _$PendingTransactionsFromJson(json);

  Map<String, dynamic> toJson() => _$PendingTransactionsToJson(this);
}
