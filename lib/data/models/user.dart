import 'package:meta_app/data/models/pending_transactions.dart';
import 'package:meta_app/data/models/referrals.dart';
import 'package:meta_app/data/models/transaction_history.dart';

class User {
  final String name;
  final String email;
  final int referralLevel;
  final Referrals referrals;
  final double availableBalance;
  final TransactionHistory transactionHistory;
  final PendingTransactions pendingTransactions;

  const User({
    required this.name,
    required this.email,
    required this.referrals,
    required this.referralLevel,
    required this.availableBalance,
    required this.transactionHistory,
    required this.pendingTransactions,
  });

  User.empty()
      : name = '',
        email = '',
        referralLevel = 0,
        availableBalance = 0,
        referrals = Referrals.empty(),
        transactionHistory = TransactionHistory.empty(),
        pendingTransactions = PendingTransactions.empty();
}
