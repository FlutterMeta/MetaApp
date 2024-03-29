import 'package:meta_app/data/models/user.dart';

class Transaction {
  final String network;
  final double amount;
  final String date;
  final String status;
  final String type;
  final String note;
  final String destinationAddress;
  final User user;

  Transaction({
    required this.network,
    required this.user,
    required this.amount,
    required this.date,
    required this.status,
    required this.note,
    required this.destinationAddress,
    required this.type,
  });

  Transaction.empty()
      : network = '',
        user = User.empty(),
        amount = 0.0,
        date = '',
        status = 'pending',
        destinationAddress = '',
        note = '',
        type = '';
}

enum TransactionStatus {
  completed,
  pending,
  canceled;
}
