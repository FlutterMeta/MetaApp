import 'package:flutter/material.dart';

import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/widgets/rights_reserved_footer.dart';
import '../../../data/models/transaction.dart';
import '../../../data/models/user.dart';
import '../../widgets/profile_header/profile_header.dart';
import '../../widgets/transaction_table/filterable_transaction_table.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileHeader.adminSearch(),
      body: SingleChildScrollView(
        child: Align(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    context.localizations.allSystemTransactions,
                    style: context.text.partnerTableSectionTitle
                        .copyWith(fontSize: 28),
                  ),
                ),
                const SizedBox(height: 20),
                FilterableTransactionTable(
                  transactions: MockTransactions.getTransactions,
                ),
                const SizedBox(height: 140),
                const Align(
                  alignment: Alignment.center,
                  child: RightsReservedFooter(),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MockTransactions {
  static final _mockTransactions = [
    Transaction(
      network: 'Tether (TRC20)',
      amount: 1000.000,
      user: User.empty(),
      note: "",
      date: '12 October 2020, 19:23',
      destinationAddress: "0x000000000",
      status: 'completed',
      type: 'Deposit',
    ),
    Transaction(
      network: 'Tether (TRC20)',
      amount: 1000.000,
      destinationAddress: "0x000000000",
      user: User.empty(),
      note: "",
      date: '12 October 2020, 19:23',
      status: 'canceled',
      type: 'Deposit',
    ),
    ...List.generate(10, (index) => Transaction.empty()),
  ];

  static List<Transaction> get getTransactions => _mockTransactions;
}
