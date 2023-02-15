import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:meta_app/presentation/widgets/rights_reserved_footer.dart';
import '../../../data/models/transaction.dart';
import '../../../data/models/user.dart';
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
    referrals: [],
  ),
);
