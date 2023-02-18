part of '../transaction_table.dart';

class _UserTransactionInfo extends StatelessWidget {
  final Transaction transaction;

  const _UserTransactionInfo({
    required this.transaction,
    Key? key,
  }) : super(key: key);

  TransactionStatus parse(String value) {
    return TransactionStatus.values.firstWhere(
      (element) => element.name == value,
      orElse: () => TransactionStatus.pending,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _TransactionInfo(
      transaction: transaction,
      trailing: _StatusChip(status: parse(transaction.status)),
      leading: _PaymentLeading(transactionNetwork: transaction.network),
    );
  }
}

class _PaymentLeading extends StatelessWidget {
  final String transactionNetwork;

  const _PaymentLeading({
    required this.transactionNetwork,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: context.color.profilePageAboveBackground,
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              transactionNetwork,
              style: context.text.profilePageBody.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              context.localizations.paymentSystem,
              style: context.text.profilePageSubtitle,
            ),
          ],
        ),
      ],
    );
  }
}
