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

class _ManageUserPanelState extends State<_ManageUserPanel>
    with MessageOverlay {
  final _priceController = TextEditingController();
  bool _isTapped = false;

  void _onBalanceChangeConfirm() async {
    if (_priceController.text.isEmpty) return;
    final newBalance = double.parse(_priceController.text);
    final usersNotifier = Provider.of<UsersNotifier>(context, listen: false);

    Result result =
        await usersNotifier.changeBalance(widget.user.id, newBalance);

    if (result.success) {
      showMessage(
        context.localizations.balanceChangedSuccessfully,
        Colors.green,
      );
    } else {
      showMessage(result.message ?? context.localizations.error, Colors.red);
    }

    _priceController.clear();
    setState(() => _isTapped = false);
  }

  void _onDelete() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(context.localizations.deleteUser),
          content: Text(
            context.localizations.deleteUserConfirmation,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(context.localizations.cancel),
            ),
            ColoredButton(
              color: context.color.profilePageError,
              onTap: () {
                _deleteUser();
                Navigator.of(context).pop();
              },
              title: context.localizations.delete,
            ),
          ],
        );
      },
    );
  }

  void _deleteUser() {
    final usersNotifier = context.read<UsersNotifier>();
    usersNotifier.deleteUser(widget.user.id);
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
              widget.user.balance.toStringAsFixed(0),
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
                onConfirm: _onBalanceChangeConfirm,
                onCancel: () => setState(() => _isTapped = false),
              ),
            ),
          ),
          const SizedBox(),
          _TableCell(
            title: context.localizations.userProfile,
            content: ColoredButton(
              onTap: _onDelete,
              color: context.color.profilePageError,
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
      child: RepaintBoundary(
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
      ),
    );
  }
}

class _BalanceEditField extends StatefulWidget {
  final double availableBalance;
  final TextEditingController priceController;

  const _BalanceEditField({
    required this.availableBalance,
    required this.priceController,
    Key? key,
  }) : super(key: key);

  @override
  State<_BalanceEditField> createState() => _BalanceEditFieldState();
}

class _BalanceEditFieldState extends State<_BalanceEditField> {
  @override
  void initState() {
    super.initState();
    widget.priceController.text = widget.availableBalance.toStringAsFixed(0);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        EditingField(
          value: widget.availableBalance.toStringAsFixed(0),
          width: 120,
          controller: widget.priceController,
        ),
        Icon(
          Icons.attach_money_rounded,
          color: context.color.profilePagePrimaryVariant,
        ),
      ],
    );
  }
}

class _PendingTransactionsRow extends StatefulWidget {
  final User user;

  const _PendingTransactionsRow({
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  State<_PendingTransactionsRow> createState() =>
      _PendingTransactionsRowState();
}

class _PendingTransactionsRowState extends State<_PendingTransactionsRow> {
  @override
  initState() {
    super.initState();
    final usersNotifier = context.read<UsersNotifier>();
    usersNotifier.getUserTransactionsByAdmin(widget.user.id);
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 110),
      child: Consumer<UsersNotifier>(
        builder: (context, usersNotifier, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                usersNotifier.users
                        .firstWhere((user) => user.id == widget.user.id)
                        .transactions
                        ?.where((transaction) =>
                            transaction.status.toLowerCase() == 'pending')
                        .length
                        .toString() ??
                    "N/A",
                style: context.text.headerNavItemHovered.copyWith(fontSize: 16),
              ),
              const SizedBox(width: 10),
              _ShowTextButton(
                onTap: () => context.router.push(
                  UserTransactionsRoute(
                    user: widget.user,
                    userName: widget.user.login,
                    showPendingTransactions: true,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
