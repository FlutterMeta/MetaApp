import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/widgets/responsive.dart';

import '../../../data/models/transaction.dart';
import '../admin_window.dart';
import '../profile_header/search_bar_controller.dart';
part 'components/transaction_info.dart';
part 'components/system_transaction_info.dart';
part 'components/user_transaction_info.dart';
part 'components/administered_user_transaction_info.dart';

class TransactionTable extends _TransactionTable {
  const TransactionTable({
    required List<Transaction> transactions,
    required bool isAcceptable,
    required bool isPaymentLeading,
    Key? key,
  }) : super(
          transactions: transactions,
          isPaymentLeading: isPaymentLeading,
          isAcceptable: isAcceptable,
          key: key,
        );

  factory TransactionTable.user({
    required List<Transaction> transactions,
    Key? key,
  }) =>
      TransactionTable(
        transactions: transactions,
        isPaymentLeading: true,
        isAcceptable: false,
        key: key,
      );

  factory TransactionTable.system({
    required List<Transaction> transactions,
    Key? key,
  }) =>
      TransactionTable(
        transactions: transactions,
        isPaymentLeading: false,
        isAcceptable: true,
        key: key,
      );

  factory TransactionTable.administeredUser({
    required List<Transaction> transactions,
    Key? key,
  }) =>
      TransactionTable(
        transactions: transactions,
        isPaymentLeading: true,
        isAcceptable: true,
        key: key,
      );
}

class _TransactionTable extends StatefulWidget {
  final List<Transaction> transactions;
  final bool isPaymentLeading;
  final bool isAcceptable;

  const _TransactionTable({
    required this.transactions,
    required this.isPaymentLeading,
    required this.isAcceptable,
    Key? key,
  }) : super(key: key);

  @override
  State<_TransactionTable> createState() => _TransactionTableState();
}

class _TransactionTableState extends State<_TransactionTable> {
  late List<Transaction> _transactions;

  void _filter() {
    final searchBarValue = SearchBarController.searchInput.value;

    setState(
      () => _transactions = widget.transactions
          .where((transaction) => transaction.user.email
              .toLowerCase()
              .contains(searchBarValue.toLowerCase()))
          .toList(),
    );
  }

  @override
  void initState() {
    super.initState();
    _transactions = widget.transactions;
    SearchBarController.searchInput.addListener(_filter);
  }

  @override
  void dispose() {
    SearchBarController.searchInput.removeListener(_filter);
    super.dispose();
  }

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
            itemCount: _transactions.length,
            itemBuilder: (_, index) {
              final transaction = _transactions[index];

              if (widget.isAcceptable) {
                if (widget.isPaymentLeading) {
                  return _AdministeredUserTransactionInfo(
                    transaction: transaction,
                  );
                } else {
                  return _SystemTransactionInfo(transaction: transaction);
                }
              } else {
                return _UserTransactionInfo(transaction: transaction);
              }
            },
            separatorBuilder: (_, __) => const SizedBox(height: 20),
          ),
        ],
      ),
    );
  }
}
