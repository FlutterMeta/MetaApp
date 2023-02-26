import 'package:meta_app/data/models/pending_transactions.dart';
import 'package:meta_app/data/models/transaction_history.dart';

class User {
  final String name;
  final String email;
  final int referralLevel;
  final double availableBalance;
  final TransactionHistory transactionHistory;
  final PendingTransactions pendingTransactions;
  final List<User> referrals;

  const User({
    required this.name,
    required this.email,
    required this.referralLevel,
    required this.availableBalance,
    required this.pendingTransactions,
    required this.transactionHistory,
    required this.referrals,
  });

  User.empty()
      : name = '',
        email = '',
        referralLevel = 0,
        availableBalance = 0,
        pendingTransactions = PendingTransactions.empty(),
        transactionHistory = TransactionHistory.empty(),
        referrals = [];
}
