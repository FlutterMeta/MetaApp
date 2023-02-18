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
      leading: _PaymentLeading(transactionNetwork: widget.transaction.network),
    );
  }
}
