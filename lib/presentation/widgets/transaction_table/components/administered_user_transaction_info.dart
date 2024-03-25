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
    extends State<_AdministeredUserTransactionInfo> with MessageOverlay {
  bool isPopupVisible = false;

  TransactionStatus parse(String value) {
    return TransactionStatus.values.firstWhere(
      (element) => element.name.toLowerCase() == value.toLowerCase(),
      orElse: () => TransactionStatus.pending,
    );
  }

  void _handleTap() {
    if (widget.transaction.status.toLowerCase() ==
        TransactionStatus.pending.name.toLowerCase()) {
      setState(() => isPopupVisible = !isPopupVisible);
    }
  }

  void _handleConfirm() async {
    var response =
        await apiRepository.approveTransaction(widget.transaction.id);
    if (response.statusCode == 200) {
      setState(() => isPopupVisible = false);
      showMessage(context.localizations.transactionApproved, Colors.green);
      TransactionsStateHandler.instance
          .edittransaction(widget.transaction.copyWith(
        status: TransactionStatus.approved.name,
      ));
      TransactionsStateHandler.controller.value++;
    }
  }

  void _handleDecline() async {
    var response =
        await apiRepository.declineTransaction(widget.transaction.id);
    if (response.statusCode == 200) {
      setState(() => isPopupVisible = false);
      showMessage(context.localizations.transactionDeclined, Colors.green);
      TransactionsStateHandler.instance
          .edittransaction(widget.transaction.copyWith(
        status: TransactionStatus.declined.name,
      ));
      TransactionsStateHandler.controller.value++;
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
            onConfirm: _handleConfirm,
            onDecline: _handleDecline,
            transaction: widget.transaction,
            onCancel: () => setState(() => isPopupVisible = false),
          ),
          child: _StatusChip(status: parse(widget.transaction.status)),
        ),
      ),
      leading: _PaymentLeading(transaction: widget.transaction),
    );
  }
}
