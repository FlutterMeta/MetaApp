part of '../user_table.dart';

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
  final _priceController = TextEditingController();
  bool _isTapped = false;

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
              '${widget.user.balance.toStringAsFixed(0)} \$',
              style: context.text.headerNavItemHovered.copyWith(fontSize: 16),
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
                  availableBalance: widget.user.balance,
                  priceController: _priceController,
                ),
                confirmText: context.localizations.change,
                onConfirm: _onConfirm,
                onCancel: () => setState(() => _isTapped = false),
              ),
            ),
          ),
          const SizedBox(),
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
            user.transactions?.length.toString() ?? '0',
            style: context.text.headerNavItemHovered.copyWith(fontSize: 16),
          ),
          const SizedBox(width: 10),
          _ShowTextButton(
            onTap: () => context.router.push(
              UserTransactionsRoute(
                user: user,
                userName: user.login,
                showPendingTransactions: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
