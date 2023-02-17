import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/widgets/rights_reserved_footer.dart';
import 'package:meta_app/presentation/widgets/transaction_table.dart';
import '../../../data/models/transaction.dart';
import '../../widgets/profile_header/profile_header.dart';

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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    context.localizations.allSystemTransactions,
                    style: context.text.partnerTableSectionTitle
                        .copyWith(fontSize: 28),
                  ),
                ),
                const SizedBox(height: 20),
                TransactionTable(transactions: mockTransactions),
                const SizedBox(height: 40),
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

final mockTransactions = [
  Transaction(
    'Tether (TRC20)',
    '1000.000',
    '12 October 2022, 19:23',
    'completed',
    'Deposit',
  ),
  Transaction(
    'Tether (TRC20)',
    '11.000',
    '1 January 2023, 10:23',
    'canceled',
    'Withdraw',
  ),
  ...List.generate(10, (index) => Transaction.empty()),
];
