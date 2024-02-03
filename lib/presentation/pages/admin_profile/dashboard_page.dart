import 'dart:math';

import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/widgets/rights_reserved_footer.dart';
import 'package:provider/provider.dart';

import '../../../data/models/transaction.dart';
import '../../../data/models/user.dart';
import '../../providers/users_notifier.dart';
import '../../widgets/profile_header/profile_header.dart';
import '../../widgets/user_table/filterable_user_table.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UsersNotifier()..loadUsers(),
      child: Scaffold(
        appBar: ProfileHeader.adminSearch(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const _HeaderText(),
              const SizedBox(height: 60),
              Consumer<UsersNotifier>(
                builder: (context, usersNotifier, child) {
                  return FilterableUserTable(users: usersNotifier.users);
                },
              ),
              const SizedBox(height: 70),
              const RightsReservedFooter(),
              const SizedBox(height: 20),
            ],
          ),
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
      role: UserRole.user,
      products: [],
      phoneNumber: '+380123456789',
    );
  },
);

List<Transaction> _generateTransactions() {
  return List.generate(
    10,
    (index) => Transaction(
      amount: Random().nextDouble() * 100000 + 100,
      date: '',
      id: index,
      login: "shookones$index",
      userId: "$index",
      paymentSystemTitle: 'Visa',
      walletKey: 'walletKey',
      status: Random().nextBool() ? 'pending' : 'completed',
      type: index % 2 == 0 ? 'withdraw' : 'deposit',
    ),
  );
}
