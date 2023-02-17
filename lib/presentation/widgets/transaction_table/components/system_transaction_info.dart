part of '../transaction_table.dart';

class _SystemTransactionInfo extends StatelessWidget {
  final Transaction transaction;

  const _SystemTransactionInfo({
    required this.transaction,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _TransactionInfo(
      transaction: transaction,
      leading: _EmailLeading(email: transaction.user.email),
    );
  }
}

class _EmailLeading extends StatelessWidget {
  final String email;

  const _EmailLeading({
    required this.email,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.account_circle,
          size: 50,
          color: context.color.profilePageSecondaryVariant,
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              email,
              style: context.text.profilePageBody.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              context.localizations.email,
              style: context.text.profilePageSubtitle,
            ),
          ],
        ),
      ],
    );
  }
}
