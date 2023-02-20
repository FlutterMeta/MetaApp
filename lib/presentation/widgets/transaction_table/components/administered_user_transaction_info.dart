part of '../transaction_table.dart';

class _AdministeredUserTransactionInfo extends StatefulWidget {
  final Transaction transaction;

  const _AdministeredUserTransactionInfo({
    required this.transaction,
    Key? key,
  }) : super(key: key);

  @override
  State<_AdministeredUserTransactionInfo> createState() =>
      _AdministeredUserTransactionInfoState();
}

class _AdministeredUserTransactionInfoState
    extends State<_AdministeredUserTransactionInfo> {
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
            target: Alignment.topRight,
          ),
          portalFollower: _PopupDialog(
            onConfirm: () {},
            transaction: widget.transaction,
            onCancel: () => setState(() => isPopupVisible = false),
          ),
          child: _StatusChip(status: parse(widget.transaction.status)),
        ),
      ),
      leading: _PaymentLeading(transactionNetwork: widget.transaction.network),
    );
  }
}
