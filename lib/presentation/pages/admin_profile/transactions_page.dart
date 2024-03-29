import 'package:flutter/material.dart';

import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/data/models/pending_transactions.dart';
import 'package:meta_app/data/models/referrals.dart';
import 'package:meta_app/data/models/transaction_history.dart';
import 'package:meta_app/presentation/widgets/rights_reserved_footer.dart';
import 'package:meta_app/presentation/widgets/transaction_table/transaction_table.dart';
import '../../../data/models/transaction.dart';
import '../../../data/models/user.dart';
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
                TransactionTable.system(
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
      user: User(
        name: ' ',
        email: 'usermail@mail.com',
        referralLevel: 0,
        availableBalance: 0,
        pendingTransactions: PendingTransactions.empty(),
        transactionHistory: TransactionHistory.empty(),
        referrals: Referrals.empty(),
      ),
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
      user: User(
        name: ' ',
        email: 'awdawdawd@mail.com',
        referralLevel: 0,
        availableBalance: 0,
        pendingTransactions: PendingTransactions.empty(),
        transactionHistory: TransactionHistory.empty(),
        referrals: Referrals.empty(),
      ),
      note: "",
      date: '12 October 2020, 19:23',
      status: 'canceled',
      type: 'Deposit',
    ),
    ...List.generate(10, (index) => Transaction.empty()),
  ];

  static List<Transaction> get getTransactions => _mockTransactions;
}
