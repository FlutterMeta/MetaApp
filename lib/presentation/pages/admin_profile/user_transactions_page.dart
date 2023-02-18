import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import '../../../data/models/user.dart';
import '../../widgets/profile_header/profile_header.dart';
import '../../widgets/rights_reserved_footer.dart';
import '../../widgets/transaction_table/transaction_table.dart';

class UserTransactionsPage extends StatelessWidget {
  final User user;
  final String userName;

  const UserTransactionsPage({
    required this.user,
    @PathParam('userName') required this.userName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileHeader.admin(),
      body: Portal(
        child: SingleChildScrollView(
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
                  TransactionTable.administeredUser(
                    transactions: user.transactionsHistory,
                  ),
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
      ),
    );
  }
}
