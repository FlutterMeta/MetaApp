part of '../transaction_table.dart';

class _SystemTransactionInfo extends StatefulWidget {
  final Transaction transaction;

  const _SystemTransactionInfo({
    required this.transaction,
    Key? key,
  }) : super(key: key);

  @override
  State<_SystemTransactionInfo> createState() => _SystemTransactionInfoState();
}

class _SystemTransactionInfoState extends State<_SystemTransactionInfo> {
  bool isPopupVisible = false;

  TransactionStatus parse(String value) {
    return TransactionStatus.values.firstWhere(
      (element) => element.name == value,
      orElse: () => TransactionStatus.pending,
    );
  }

  void _handleTap() {
    if (widget.transaction.status == TransactionStatus.pending.name) {
      setState(() => isPopupVisible = !isPopupVisible);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _TransactionInfo(
      transaction: widget.transaction,
      trailing: GestureDetector(
        onTap: _handleTap,
        child: PortalTarget(
          visible: isPopupVisible,
          anchor: const Aligned(
            follower: Alignment.topRight,
            target: Alignment.topLeft,
          ),
          portalFollower: _PopupDialog(
            onConfirm: () {},
            transaction: widget.transaction,
            onCancel: () => setState(() => isPopupVisible = false),
          ),
          child: _StatusChip(status: parse(widget.transaction.status)),
        ),
      ),
      leading: _EmailLeading(email: widget.transaction.user.email),
    );
  }
}

class _PopupDialog extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final Transaction transaction;

  const _PopupDialog({
    required this.onConfirm,
    required this.onCancel,
    required this.transaction,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints(maxWidth: Responsive.isMobile(context) ? 340 : 400),
      child: AdminWindow(
        title: context.localizations.requestAwaitingPayment,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _TextTile(
              title: context.localizations.walletAdress,
              value: transaction.walletKey.toString(),
            ),
            _TextTile(
              title: context.localizations.network,
              value: transaction.paymentSystemTitle,
            ),
            _TextTile(
              title: context.localizations.transactionAmount,
              value: "${transaction.amount.toStringAsFixed(2)} \$",
            ),
          ],
        ),
        confirmText: context.localizations.confirmRequest,
        onConfirm: onConfirm,
        onCancel: onCancel,
      ),
    );
  }
}

class _TextTile extends StatelessWidget {
  final String title;
  final String value;

  const _TextTile({
    required this.title,
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: [
          SizedBox(width: 120, child: Text(title)),
          SizedBox(width: 240, child: Text(value)),
        ],
      ),
    );
  }
}

class _EmailLeading extends StatelessWidget {
  final String email;

  const _EmailLeading({
    required this.email,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.account_circle,
          size: 50,
          color: context.color.profilePageSecondaryVariant,
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              email,
              style: context.text.profilePageBody.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              context.localizations.email,
              style: context.text.profilePageSubtitle,
            ),
          ],
        ),
      ],
    );
  }
}
