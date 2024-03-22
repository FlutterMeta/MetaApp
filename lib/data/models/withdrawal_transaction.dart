import 'package:json_annotation/json_annotation.dart';

part 'withdrawal_transaction.g.dart';

@JsonSerializable()
class WithdrawalTransaction {
  final double sum;
  final String walletKey;
  final int paymentSystemId;

  WithdrawalTransaction({
    required this.sum,
    required this.paymentSystemId,
    required this.walletKey,
  });

  factory WithdrawalTransaction.fromJson(Map<String, dynamic> json) =>
      _$WithdrawalTransactionFromJson(json);

  Map<String, dynamic> toJson() => _$WithdrawalTransactionToJson(this);
}
