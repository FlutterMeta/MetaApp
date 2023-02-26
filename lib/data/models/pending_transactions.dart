import 'package:meta_app/data/models/transaction.dart';

class PendingTransactions {
  final List<Transaction> transactions;

  const PendingTransactions({
    required this.transactions,
  });

  PendingTransactions.empty() : transactions = [];
}
