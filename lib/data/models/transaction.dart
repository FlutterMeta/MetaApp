import 'package:meta_app/data/models/user.dart';

class Transaction {
  final String network;
  final String amount;
  final String date;
  final String status;
  final String type;
  final String note;
  final User user;

  Transaction({
    required this.network,
    required this.user,
    required this.amount,
    required this.date,
    required this.status,
    required this.note,
    required this.type,
  });

  Transaction.empty()
      : network = '',
        user = User.empty(),
        amount = '',
        date = '',
        status = '',
        note = '',
        type = '';
}

enum TransactionStatus {
  completed,
  pending,
  canceled;
}
