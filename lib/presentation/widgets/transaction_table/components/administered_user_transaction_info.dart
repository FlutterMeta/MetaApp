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
  late TransactionsNotifier transactionsNotifier;

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
        await transactionsNotifier.approveTransaction(widget.transaction);
    if (response.success == true) {
      setState(() => isPopupVisible = false);
      showMessage(context.localizations.transactionApproved, Colors.green);
    } else {
      showMessage(
          response.message ?? context.localizations.errorOccurred, Colors.red);
    }
  }

  void _handleDecline() async {
    var response =
        await transactionsNotifier.declineTransaction(widget.transaction);
    if (response.success == true) {
      setState(() => isPopupVisible = false);
      showMessage(context.localizations.transactionDeclined, Colors.green);
    } else {
      showMessage(
          response.message ?? context.localizations.errorOccurred, Colors.red);
    }
  }

  @override
  void initState() {
    transactionsNotifier = context.read<TransactionsNotifier>();
    super.initState();
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
