import 'package:flutter/material.dart';

import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/pages/admin_profile/transactions_state_handler.dart';
import 'package:meta_app/presentation/widgets/rights_reserved_footer.dart';
import '../../widgets/profile_header/profile_header.dart';
import '../../widgets/transaction_table/filterable_transaction_table.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  @override
  void initState() {
    super.initState();
    TransactionsStateHandler.instance.init();
  }

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
                ValueListenableBuilder(
                  valueListenable: TransactionsStateHandler.controller,
                  builder: (context, int value, child) {
                    return FilterableTransactionTable(
                      transactions:
                          TransactionsStateHandler.instance.transactions,
                    );
                  },
                ),
                const SizedBox(height: 280),
                const Align(
                  alignment: Alignment.center,
                  child: RightsReservedFooter(),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
