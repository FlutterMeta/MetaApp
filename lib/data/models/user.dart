import 'transaction.dart';

class User {
  final String name;
  final String email;
  final int referralLevel;
  final double availableBalance;
  final List<Transaction> pendingTransactions;
  final List<Transaction> transactionsHistory;
  final List<User> referrals;

  const User({
    required this.name,
    required this.email,
    required this.referralLevel,
    required this.availableBalance,
    required this.pendingTransactions,
    required this.transactionsHistory,
    required this.referrals,
  });

  User.empty()
      : name = '',
        email = '',
        referralLevel = 0,
        availableBalance = 0,
        pendingTransactions = [],
        transactionsHistory = [],
        referrals = [];
}
