import 'package:meta_app/data/models/transaction.dart';

class TransactionHistory {
  final List<Transaction> transactions;

  const TransactionHistory({
    required this.transactions,
  });

  TransactionHistory.empty() : transactions = [];
}
