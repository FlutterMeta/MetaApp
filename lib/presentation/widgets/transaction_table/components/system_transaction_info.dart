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

  @override
  Widget build(BuildContext context) {
    return _TransactionInfo(
      transaction: widget.transaction,
      trailing: GestureDetector(
        onTap: () => setState(() => isPopupVisible = !isPopupVisible),
        child: PortalTarget(
          visible: isPopupVisible,
          portalFollower: _PopupDialog(
            onConfirm: () {},
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

  const _PopupDialog({
    required this.onConfirm,
    required this.onCancel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdminWindow(
      title: context.localizations.aboutAurora,
      content: Column(),
      confirmText: context.localizations.aboutAurora,
      onConfirm: onConfirm,
      onCancel: onCancel,
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
