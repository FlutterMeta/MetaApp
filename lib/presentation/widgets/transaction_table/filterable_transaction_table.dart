import 'package:flutter/material.dart';
import 'package:meta_app/presentation/widgets/transaction_table/transaction_table.dart';

import '../../../data/models/transaction.dart';
import '../profile_header/search_bar_controller.dart';

class FilterableTransactionTable extends StatefulWidget {
  final List<Transaction> transactions;

  const FilterableTransactionTable({
    required this.transactions,
    Key? key,
  }) : super(key: key);

  @override
  State<FilterableTransactionTable> createState() =>
      _FilterableTransactionTableState();
}

class _FilterableTransactionTableState
    extends State<FilterableTransactionTable> {
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
    return TransactionTable.system(transactions: _transactions);
  }
}
