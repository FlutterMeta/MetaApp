import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/widgets/admin_window.dart';
import 'package:meta_app/presentation/widgets/colored_button.dart';
import 'package:meta_app/presentation/widgets/editing_field.dart';
import 'package:meta_app/presentation/widgets/responsive.dart';

import '../pages/client_profile/sections/dashboard_tab.dart';

class UserTable extends StatelessWidget {
  final List<User> users;

  const UserTable({
    required this.users,
    Key? key,
  }) : super(key: key);

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
              physics: const NeverScrollableScrollPhysics(),
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
          _AvatarCell(user: user),
          _TableCell(
            title: context.localizations.email,
            content: Text(user.email, style: context.text.adminUserTableLabel),
          ),
          _TableCell(
            title: context.localizations.referralLevel,
            content: Text(
              user.referralLevel.toString(),
              style: context.text.adminUserTableLabel,
            ),
          ),
          _TableCell(
            title: context.localizations.referrals,
            content: _ShowText(onTap: () {}),
          ),
          _TableCell(
            title: context.localizations.transactionHistory,
            content: _ShowText(onTap: () {}),
          ),
        ],
      ),
    );
  }
}

class _AvatarCell extends StatelessWidget {
  final User user;

  const _AvatarCell({
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.account_circle,
          size: Responsive.isDesktop(context) ? 80 : 50,
          color: context.color.partnersCardBackground,
        ),
        const SizedBox(width: 8),
        _TableCell(
          title: context.localizations.nickname,
          content: Text(user.name, style: context.text.adminUserTableLabel),
        ),
      ],
    );
  }
}

class _ManageUserPanel extends StatefulWidget {
  final User user;

  const _ManageUserPanel({
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  State<_ManageUserPanel> createState() => _ManageUserPanelState();
}

class _ManageUserPanelState extends State<_ManageUserPanel> {
  bool _isTapped = false;
  final _priceController = TextEditingController();

  void _onConfirm() {
    if (_priceController.text.isEmpty) return;
    _priceController.clear();
    setState(() => _isTapped = false);
  }

  @override
  void dispose() {
    _priceController.dispose();
    super.dispose();
  }

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
            content: Text(
              '${widget.user.availableBalance.toStringAsFixed(0)} \$',
              style: context.text.headerNavItemHovered.copyWith(fontSize: 15),
            ),
          ),
          _TableCell(
            title: context.localizations.pendingTransactions,
            content: _PendingTransactionsRow(user: widget.user),
          ),
          _TableCell(
            title: context.localizations.changeOfBalance,
            content: _ChangeBalanceButton(
              isWindowVisible: _isTapped,
              onTap: () => setState(() => _isTapped = true),
              title: context.localizations.change,
              color: context.color.profilePagePrimary,
              window: AdminWindow(
                title: "${context.localizations.availableBalance}:",
                content: _BalanceEditField(
                  availableBalance: widget.user.availableBalance,
                  priceController: _priceController,
                ),
                confirmText: context.localizations.change,
                onConfirm: _onConfirm,
                onCancel: () => setState(() => _isTapped = false),
              ),
            ),
          ),
          SizedBox(width: context.screenWidth * 0.01),
          _TableCell(
            title: context.localizations.userProfile,
            content: ColoredButton(
              onTap: () {},
              color: context.color.profilePagePrimary,
              title: context.localizations.delete,
            ),
          ),
        ],
      ),
    );
  }
}

class _ChangeBalanceButton extends StatefulWidget {
  final String title;
  final Color color;
  final VoidCallback onTap;
  final bool isWindowVisible;
  final Widget window;

  const _ChangeBalanceButton({
    required this.title,
    required this.color,
    required this.onTap,
    required this.isWindowVisible,
    required this.window,
    Key? key,
  }) : super(key: key);

  @override
  State<_ChangeBalanceButton> createState() => _ChangeBalanceButtonState();
}

class _ChangeBalanceButtonState extends State<_ChangeBalanceButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: PortalTarget(
        anchor: const Aligned(
          follower: Alignment.topCenter,
          target: Alignment.bottomRight,
        ),
        visible: widget.isWindowVisible,
        portalFollower: widget.window,
        child: ColoredButton(
          title: widget.title,
          color: widget.color,
          onTap: widget.onTap,
        ),
      ),
    );
  }
}

class _BalanceEditField extends StatelessWidget {
  final double availableBalance;
  final TextEditingController priceController;

  const _BalanceEditField({
    required this.availableBalance,
    required this.priceController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        EditingField(
          value: availableBalance.toStringAsFixed(0),
          width: 120,
          controller: priceController,
        ),
        Icon(
          Icons.attach_money_rounded,
          color: context.color.profilePagePrimaryVariant,
        ),
      ],
    );
  }
}

class _PendingTransactionsRow extends StatelessWidget {
  final User user;

  const _PendingTransactionsRow({
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 110),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            user.pendingTransactions.length.toString(),
            style: context.text.headerNavItemHovered.copyWith(fontSize: 15),
          ),
          const SizedBox(width: 10),
          _ShowText(onTap: () {}),
        ],
      ),
    );
  }
}

class _TableCell extends StatelessWidget {
  final String title;
  final Widget content;

  const _TableCell({
    required this.title,
    required this.content,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.text.adminUserTableLabel.copyWith(fontSize: 12),
        ),
        const SizedBox(height: 10),
        content,
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
            style: context.text.adminUserTableLabel
                .copyWith(color: _getTextColor(context)),
          ),
        ),
      ),
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
