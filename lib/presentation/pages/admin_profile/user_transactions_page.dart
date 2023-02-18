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
  late List<Transaction> transactionsHistory;

  void _getFilteredTransactions() {
    final result = widget.transactionsHistory.where((transaction) {
      final operation = _operationFieldController.text.toLowerCase();
      final status = _statusFieldController.text.toLowerCase();
      final paymentSystem = _paymentSystemFieldController.text.toLowerCase();
      final note = _noteFieldController.text.toLowerCase();

      return transaction.type.toLowerCase().contains(operation) &&
          transaction.status.toLowerCase().contains(status) &&
          transaction.network.toLowerCase().contains(paymentSystem) &&
          transaction.note.toLowerCase().contains(note);
    }).toList();

    setState(() => transactionsHistory = result);
  }

  @override
  void initState() {
    transactionsHistory = widget.transactionsHistory;
    super.initState();
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
          onFieldChanged: _getFilteredTransactions,
        ),
        const SizedBox(height: 20),
        TransactionTable.administeredUser(
          transactions: transactionsHistory,
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
  final VoidCallback onFieldChanged;

  const _FilterWindow({
    required this.operationFieldController,
    required this.statusFieldController,
    required this.paymentSystemFieldController,
    required this.noteFieldController,
    required this.onFieldChanged,
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
                  onFieldChanged: onFieldChanged,
                  title: context.localizations.operation,
                  controller: operationFieldController,
                ),
                _FilterField(
                  onFieldChanged: onFieldChanged,
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
                  onFieldChanged: onFieldChanged,
                  title: context.localizations.status,
                  controller: statusFieldController,
                ),
                _FilterField(
                  onFieldChanged: onFieldChanged,
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
  final VoidCallback onFieldChanged;
  final TextEditingController controller;

  const _FilterField({
    required this.title,
    required this.controller,
    required this.onFieldChanged,
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
            onChanged: (_) => onFieldChanged(),
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
