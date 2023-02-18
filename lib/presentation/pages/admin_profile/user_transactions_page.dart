import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/widgets/responsive.dart';
import 'package:meta_app/presentation/widgets/user_table/user_table.dart';
import '../../../data/models/transaction.dart';
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
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.center,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      context.localizations.userTransactions,
                      style: context.text.partnerTableSectionTitle
                          .copyWith(fontSize: 28),
                    ),
                  ),
                  const SizedBox(height: 20),
                  UserGeneralInfoPanel(user: user),
                  const SizedBox(height: 20),
                  _TransactionTableWithFilter(
                    transactionsHistory: user.transactionsHistory,
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

class _TransactionTableWithFilter extends StatefulWidget {
  final List<Transaction> transactionsHistory;

  const _TransactionTableWithFilter({
    required this.transactionsHistory,
    Key? key,
  }) : super(key: key);

  @override
  State<_TransactionTableWithFilter> createState() =>
      __TransactionTableWithFilterState();
}

class __TransactionTableWithFilterState
    extends State<_TransactionTableWithFilter> {
  final _operationFieldController = TextEditingController();
  final _statusFieldController = TextEditingController();
  final _paymentSystemFieldController = TextEditingController();
  final _noteFieldController = TextEditingController();

  List<Transaction> _getFilteredTransactions() {
    return widget.transactionsHistory.where((transaction) {
      final operation = _operationFieldController.text;
      final status = _statusFieldController.text;
      final paymentSystem = _paymentSystemFieldController.text;
      final note = _noteFieldController.text;

      return transaction.type.contains(operation) &&
          transaction.status.contains(status) &&
          transaction.network.contains(paymentSystem) &&
          transaction.note.contains(note);
    }).toList();
  }

  @override
  void dispose() {
    _operationFieldController.dispose();
    _statusFieldController.dispose();
    _paymentSystemFieldController.dispose();
    _noteFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _FilterWindow(
          operationFieldController: _operationFieldController,
          statusFieldController: _statusFieldController,
          paymentSystemFieldController: _paymentSystemFieldController,
          noteFieldController: _noteFieldController,
        ),
        const SizedBox(height: 20),
        TransactionTable.administeredUser(
          transactions: _getFilteredTransactions(),
        ),
      ],
    );
  }
}

class _FilterWindow extends StatelessWidget {
  final TextEditingController operationFieldController;
  final TextEditingController statusFieldController;
  final TextEditingController paymentSystemFieldController;
  final TextEditingController noteFieldController;

  const _FilterWindow({
    required this.operationFieldController,
    required this.statusFieldController,
    required this.paymentSystemFieldController,
    required this.noteFieldController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.color.profilePageBackground,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: context.color.profilePagePrimary.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.localizations.historyOfTransactions,
            style: context.text.profilePageBody.copyWith(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            context.localizations.timeOfPayments,
            style: context.text.profilePageSubtitle,
          ),
          const _Divider(),
          Align(
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                _FilterField(
                  title: context.localizations.operation,
                  controller: operationFieldController,
                ),
                _FilterField(
                  title: context.localizations.paySystem,
                  controller: paymentSystemFieldController,
                ),
              ],
            ),
          ),
          const _Divider(),
          Align(
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.spaceBetween,
              children: [
                _FilterField(
                  title: context.localizations.status,
                  controller: statusFieldController,
                ),
                _FilterField(
                  title: context.localizations.note,
                  controller: noteFieldController,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Divider(
        color: context.color.greyish.withOpacity(0.2),
        thickness: 0.1,
      ),
    );
  }
}

class _FilterField extends StatelessWidget {
  final String title;
  final TextEditingController controller;

  const _FilterField({
    required this.title,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(width: 70, child: Text(title)),
        const SizedBox(width: 10),
        Container(
          width: Responsive.isMobile(context) || Responsive.isTablet(context)
              ? context.screenWidth * 0.48
              : context.screenWidth * 0.24,
          constraints: const BoxConstraints(maxWidth: 400),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: context.color.greyish.withOpacity(0.3)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: context.color.greyish.withOpacity(0.7)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
