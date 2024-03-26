import 'package:json_annotation/json_annotation.dart';
import 'package:meta_app/data/models/user.dart';

part 'transaction.g.dart';

@JsonSerializable(explicitToJson: true)
class Transaction {
  final int id;
  final String date;
  final String status;
  final String type;
  final double amount;
  final String walletKey;
  final String? externalId;
  final User user;
  final String? paymentSystemTitle;
  final String? paymentSystemImage;
  final String? paymentSystemNetwork;

  Transaction({
    required this.id,
    required this.date,
    required this.status,
    required this.type,
    required this.amount,
    required this.externalId,
    required this.walletKey,
    required this.user,
    required this.paymentSystemTitle,
    this.paymentSystemImage,
    this.paymentSystemNetwork,
  });

  Transaction copyWith({
    int? id,
    String? date,
    String? status,
    String? type,
    double? amount,
    String? walletKey,
    User? user,
    String? paymentSystemTitle,
    String? externalId,
    String? paymentSystemImage,
    String? paymentSystemNetwork,
  }) {
    return Transaction(
      id: id ?? this.id,
      date: date ?? this.date,
      status: status ?? this.status,
      type: type ?? this.type,
      amount: amount ?? this.amount,
      externalId: externalId,
      walletKey: walletKey ?? this.walletKey,
      user: user ?? this.user,
      paymentSystemTitle: paymentSystemTitle ?? this.paymentSystemTitle,
      paymentSystemImage: paymentSystemImage ?? this.paymentSystemImage,
      paymentSystemNetwork: paymentSystemNetwork ?? this.paymentSystemNetwork,
    );
  }

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}

enum TransactionStatus {
  approved,
  declined,
  pending,
}
