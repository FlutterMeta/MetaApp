import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/pages/client_profile/sections/dashboard_tab.dart';
import 'package:meta_app/presentation/widgets/rights_reserved_footer.dart';
import '../../widgets/profile_header/profile_header.dart';
import '../../widgets/user_table.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileHeader.adminSearch(),
      body: SingleChildScrollView(
        child: Portal(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const _HeaderText(),
              const SizedBox(height: 60),
              UserTable(users: usersExampleList),
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
  const _HeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1270),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          context.localizations.userTable,
          style: context.text.partnerTableSectionTitle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

final List<User> usersExampleList = List.generate(
  10,
  (index) => User(
    name: 'shookones$index',
    email: 'usermail$index@mail.com',
    referralLevel: index,
    availableBalance: Random().nextDouble() * 100000 + 100,
    pendingTransactions:
        List.generate(Random().nextInt(4), (_) => Transaction.empty()),
    transactionsHistory:
        List.generate(Random().nextInt(10), (_) => Transaction.empty()),
    referrals: List.generate(
      3,
      (index) => User(
        name: 'Referali Italiano $index',
        email: 'referalimail$index@mail.com',
        referralLevel: index + 2,
        availableBalance: Random().nextDouble() * 100000 + 100,
        pendingTransactions:
            List.generate(Random().nextInt(4), (_) => Transaction.empty()),
        transactionsHistory:
            List.generate(Random().nextInt(10), (_) => Transaction.empty()),
        referrals: [],
      ),
    ),
  ),
);
