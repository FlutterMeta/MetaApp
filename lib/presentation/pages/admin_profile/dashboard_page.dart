import 'dart:math';

import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/widgets/rights_reserved_footer.dart';

import '../../../data/models/pending_transactions.dart';
import '../../../data/models/referrals.dart';
import '../../../data/models/transaction.dart';
import '../../../data/models/transaction_history.dart';
import '../../../data/models/user.dart';
import '../../widgets/profile_header/profile_header.dart';
import '../../widgets/user_table/filterable_user_table.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileHeader.adminSearch(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const _HeaderText(),
            const SizedBox(height: 60),
            FilterableUserTable(users: usersExampleList),
            const SizedBox(height: 70),
            const RightsReservedFooter(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _HeaderText extends StatelessWidget {
  const _HeaderText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1270),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          context.localizations.userTable,
          style: context.text.partnerTableSectionTitle.copyWith(fontSize: 28),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

final List<User> usersExampleList = List.generate(
  10,
  (index) {
    final transactions = _generateTransactions();

    return User(
      id: "$index",
      key: "s",
      login: 'shookones$index',
      email: 'usermail$index@mail.com',
      level: index,
      balance: Random().nextDouble() * 100000 + 100,
      transactions: transactions,
      products: [],
      phoneNumber: '+380123456789',
    );
  },
);

List<Transaction> _generateTransactions() {
  return List.generate(
    10,
    (index) => Transaction(
      network: index % 2 == 0 ? 'Tether (TRC20)' : 'Tron (TRX)',
      amount: Random().nextDouble() * 100000 + 100,
      user: User.empty(),
      date: '',
      note: '$index',
      destinationAddress: "Tw9a8zmv6c4u2rk1w3o0f12c63hs2saq",
      status: Random().nextBool() ? 'pending' : 'completed',
      type: index % 2 == 0 ? 'withdraw' : 'deposit',
    ),
  );
}
