part of '../transaction_table.dart';

class _UserTransactionInfo extends StatelessWidget {
  final Transaction transaction;

  const _UserTransactionInfo({
    required this.transaction,
    Key? key,
  }) : super(key: key);

  TransactionStatus parse(String value) {
    return TransactionStatus.values.firstWhere(
      (element) => element.name.toLowerCase() == value.toLowerCase(),
      orElse: () => TransactionStatus.pending,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _TransactionInfo(
      transaction: transaction,
      trailing: _StatusChip(status: parse(transaction.status)),
      leading: _PaymentLeading(transaction: transaction),
    );
  }
}

class _PaymentLeading extends StatelessWidget {
  final Transaction transaction;

  const _PaymentLeading({
    required this.transaction,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.memory(
          base64Decode(transaction.paymentSystemImage ?? ''),
          height: 50,
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${transaction.paymentSystemTitle!} (${transaction.paymentSystemNetwork!})',
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
