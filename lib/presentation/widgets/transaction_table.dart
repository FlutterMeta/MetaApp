import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';

import '../../data/models/transaction.dart';

class TransactionTable extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionTable({
    required this.transactions,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.color.profilePageBackground,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      constraints: const BoxConstraints(maxWidth: 1200),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        children: [
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: transactions.length,
            itemBuilder: (_, index) {
              return _TransactionInfo(transaction: transactions[index]);
            },
            separatorBuilder: (_, __) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(),
              );
            },
          ),
        ],
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
      (element) => element.name == value,
      orElse: () => TransactionStatus.pending,
    );
  }

  TextStyle transactionTextStyle(BuildContext context) {
    return context.text.profilePageBody.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
  }

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
                color: context.color.profilePageAboveBackground,
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.network,
                  style: transactionTextStyle(context),
                ),
                const SizedBox(height: 6),
                Text(
                  context.localizations.paymentSystem,
                  style: context.text.profilePageSubtitle,
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.date,
                style: transactionTextStyle(context),
              ),
              const SizedBox(height: 6),
              Text(
                context.localizations.operationDate,
                style: context.text.profilePageSubtitle,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 100,
          child: Text(
            transaction.amount,
            style: transactionTextStyle(context),
          ),
        ),
        SizedBox(
          width: 80,
          child: Text(
            transaction.type,
            style: transactionTextStyle(context),
          ),
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
          status.name,
          style: context.text.profilePageBody.copyWith(
            fontSize: 13,
            color: _chipColor,
          ),
        ),
      ),
    );
  }
}
