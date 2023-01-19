import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/themes/theme.dart';

class TransactionsHistorySection extends StatelessWidget {
  const TransactionsHistorySection({Key? key}) : super(key: key);

  static const _transactionsTextStyle = TextStyle(
    fontSize: 20,
  );
  static const _timeTextStyle = TextStyle(
    fontSize: 13,
    color: AppColors.greyish,
  );
  static final _transactions = [
    Transaction(
      'Tether (TRC20)',
      '1000.000',
      '12 October 2022, 19:23',
      'Completed',
      'Deposit',
    ),
    Transaction(
      'Tether (TRC20)',
      '11.000',
      '1 January 2023, 10:23',
      'Pending',
      'Withdraw',
    ),
    Transaction(
      'Tether (TRC20)',
      '1000.000',
      '12 October 2020, 19:23',
      'Cancelled',
      'Deposit',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(30),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.localizations.historyOfTransactions,
              style: _transactionsTextStyle,
            ),
            const SizedBox(height: 10),
            Text(
              context.localizations.timeOfPayments,
              style: _timeTextStyle,
            ),
            const SizedBox(height: 30),
            Column(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _transactions.length,
                  itemBuilder: (_, index) {
                    return _TransactionInfo(
                      transaction: _transactions[index],
                    );
                  },
                  separatorBuilder: (_, __) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Divider(color: AppColors.greyish),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TransactionInfo extends StatelessWidget {
  final Transaction transaction;

  const _TransactionInfo({
    required this.transaction,
    Key? key,
  }) : super(key: key);

  TransactionStatus parse(String value) {
    return TransactionStatus.values.firstWhere(
      (element) => element.value == value,
      orElse: () => TransactionStatus.pending,
    );
  }

  static const _transactionTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      runAlignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 10,
      runSpacing: 10,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.black,
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.network,
                  style: _transactionTextStyle,
                ),
                const SizedBox(height: 5),
                Text(
                  context.localizations.paymentSystem,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.greyish,
                  ),
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              transaction.date,
              style: _transactionTextStyle,
            ),
            const SizedBox(height: 5),
            Text(
              context.localizations.operationDate,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.greyish,
              ),
            ),
          ],
        ),
        Text(
          transaction.amount,
          style: _transactionTextStyle,
        ),
        Text(
          transaction.type,
          style: _transactionTextStyle,
        ),
        _StatusChip(status: parse(transaction.status)),
      ],
    );
  }
}

class _StatusChip extends StatelessWidget {
  final TransactionStatus status;

  const _StatusChip({
    required this.status,
    Key? key,
  }) : super(key: key);

  Color get _chipColor {
    switch (status) {
      case TransactionStatus.completed:
        return Colors.green;
      case TransactionStatus.pending:
        return Colors.yellow;
      case TransactionStatus.canceled:
        return Colors.red;
      default:
        return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusTextStyle = TextStyle(
      fontSize: 13,
      color: _chipColor,
    );

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: _chipColor),
        borderRadius: BorderRadius.circular(100),
      ),
      width: 90,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(
          status.value,
          style: statusTextStyle,
        ),
      ),
    );
  }
}

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
