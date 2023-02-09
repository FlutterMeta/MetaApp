import 'dart:math';

import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/pages/client_profile/sections/dashboard_tab.dart';
import 'package:meta_app/presentation/widgets/colored_button.dart';
import '../../widgets/profile_header/profile_header.dart';
import '../../widgets/responsive.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileHeader.adminSearch(),
      body: const SingleChildScrollView(child: _TableSection()),
    );
  }
}

final List<User> users = List.generate(
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

class _TableSection extends StatelessWidget {
  const _TableSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1270),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              context.localizations.userTable,
              style: context.text.partnerTableSectionTitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _UserInformationPanel(user: users[index]),
                    const Divider(),
                    _ManageUserPanel(user: users[index]),
                  ],
                );
              },
              separatorBuilder: (_, __) => const Divider(),
              itemCount: users.length,
            ),
          ],
        ),
      ),
    );
  }
}

class _UserInformationPanel extends StatelessWidget {
  final User user;

  const _UserInformationPanel({
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.spaceBetween,
        spacing: 20,
        runSpacing: 20,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.account_circle,
                size: Responsive.isDesktop(context) ? 80 : 50,
                color: context.color.partnersCardBackground,
              ),
              _TableCell(
                title: context.localizations.nickname,
                value: user.name,
              ),
            ],
          ),
          _TableCell(
            title: context.localizations.email,
            value: user.email,
          ),
          _TableCell(
            title: context.localizations.referralLevel,
            value: user.referralLevel.toString(),
          ),
          _TableShowCell(
            title: context.localizations.referrals,
            onTap: () {},
          ),
          _TableShowCell(
            title: context.localizations.transactionHistory,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _ManageUserPanel extends StatelessWidget {
  final User user;

  const _ManageUserPanel({
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.color.profilePageSecondaryVariant.withOpacity(0.1),
      padding: const EdgeInsets.only(top: 6, bottom: 20, left: 20, right: 20),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 20,
        runSpacing: 20,
        children: [
          _TableCell(
            title: context.localizations.availableBalance,
            value: '${user.availableBalance.toStringAsFixed(0)} \$',
          ),
          _TableCell(
            title: context.localizations.pendingTransactions,
            value: user.pendingTransactions.length.toString(),
          ),
          _TableButtonCell(
            title: context.localizations.changeOfBalance,
            buttonLabel: context.localizations.change,
            onTap: () {},
          ),
          SizedBox(width: context.screenWidth * 0.01),
          _TableButtonCell(
            title: context.localizations.userProfile,
            buttonLabel: context.localizations.delete,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _TableCell extends StatelessWidget {
  final String title;
  final String value;

  const _TableCell({
    required this.title,
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.text.partnerTableSectionCellTitle,
        ),
        const SizedBox(height: 10),
        Text(
          value,
          style: context.text.partnerTableSectionIncomeCell,
        ),
      ],
    );
  }
}

class _TableShowCell extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _TableShowCell({
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.text.partnerTableSectionCellTitle,
        ),
        const SizedBox(height: 10),
        _ShowText(onTap: onTap),
      ],
    );
  }
}

class _ShowText extends StatefulWidget {
  final VoidCallback onTap;

  const _ShowText({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  State<_ShowText> createState() => _ShowTextState();
}

class _ShowTextState extends State<_ShowText> {
  bool _isHovered = false;

  Color _getTextColor(BuildContext context) {
    if (_isHovered) {
      return context.color.profilePagePrimary.withOpacity(0.7);
    } else {
      return context.color.profilePagePrimary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: Container(
          padding: const EdgeInsets.only(bottom: 2),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: _getTextColor(context),
                width: 1,
              ),
            ),
          ),
          child: Text(
            context.localizations.show,
            style: context.text.profilePageBody
                .copyWith(color: _getTextColor(context)),
          ),
        ),
      ),
    );
  }
}

class _TableButtonCell extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final String buttonLabel;

  const _TableButtonCell({
    required this.title,
    required this.onTap,
    required this.buttonLabel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.text.partnerTableSectionCellTitle,
        ),
        const SizedBox(height: 10),
        ColoredButton(
          onTap: onTap,
          color: context.color.profilePagePrimary,
          title: buttonLabel,
        ),
      ],
    );
  }
}

class User {
  final String name;
  final String email;
  final int referralLevel;
  final double availableBalance;
  final List<Transaction> pendingTransactions;
  final List<Transaction> transactionsHistory;
  final List<User> referrals;

  const User({
    required this.name,
    required this.email,
    required this.referralLevel,
    required this.availableBalance,
    required this.pendingTransactions,
    required this.transactionsHistory,
    required this.referrals,
  });
}
