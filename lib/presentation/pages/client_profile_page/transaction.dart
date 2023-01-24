class Transaction {
  final String network;
  final String amount;
  final String date;
  final String status;
  final String type;

  Transaction(this.network, this.amount, this.date, this.status, this.type);
}

enum TransactionStatus {
  completed("Completed"),
  pending("Pending"),
  canceled("Cancelled");

  final String value;
  const TransactionStatus(this.value);
}
