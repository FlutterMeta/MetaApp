import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';

import '../../../data/models/transaction.dart';
part 'components/transaction_info.dart';
part 'components/system_transaction_info.dart';
part 'components/user_transaction_info.dart';

class TransactionTable extends _TransactionTable {
  const TransactionTable({
    required List<Transaction> transactions,
    required bool isSystem,
    Key? key,
  }) : super(transactions: transactions, isSystem: isSystem, key: key);

  factory TransactionTable.user({
    required List<Transaction> transactions,
    Key? key,
  }) =>
      TransactionTable(
        transactions: transactions,
        isSystem: false,
        key: key,
      );

  factory TransactionTable.system({
    required List<Transaction> transactions,
    Key? key,
  }) =>
      TransactionTable(
        transactions: transactions,
        isSystem: true,
        key: key,
      );
}

class _TransactionTable extends StatelessWidget {
  final List<Transaction> transactions;
  final bool isSystem;

  const _TransactionTable({
    required this.transactions,
    required this.isSystem,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.color.profilePageBackground,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: context.color.profilePagePrimary.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
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
              final transaction = transactions[index];
              return isSystem
                  ? _SystemTransactionInfo(transaction: transaction)
                  : _UserTransactionInfo(transaction: transaction);
            },
            separatorBuilder: (_, __) => const SizedBox(height: 20),
          ),
        ],
      ),
    );
  }
}
