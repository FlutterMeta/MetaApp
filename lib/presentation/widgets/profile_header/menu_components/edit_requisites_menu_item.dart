part of '../menu.dart';

class _EditRequisitesMenuItem extends StatefulWidget {
  final VoidCallback closeMenuCallback;

  const _EditRequisitesMenuItem({
    required this.closeMenuCallback,
    Key? key,
  }) : super(key: key);

  @override
  State<_EditRequisitesMenuItem> createState() =>
      _EditRequisitesMenuItemState();
}

class _EditRequisitesMenuItemState extends State<_EditRequisitesMenuItem> {
  void _showDialog() {
    widget.closeMenuCallback.call();
    showDialog(
      context: context,
      builder: (context) => _AdminDialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.localizations.requisites,
              style: context.text.profileBotsDefault.copyWith(fontSize: 20),
            ),
            const SizedBox(height: 20),
            const _RequisitesFields(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _MenuItem(
      onTap: _showDialog,
      title: context.localizations.requisites,
      icon: Icons.account_balance_wallet_rounded,
      color: context.color.profilePagePrimaryVariant,
    );
  }
}

class _RequisitesFields extends StatefulWidget {
  const _RequisitesFields({Key? key}) : super(key: key);

  @override
  State<_RequisitesFields> createState() => _RequisitesFieldsState();
}

class _RequisitesFieldsState extends State<_RequisitesFields> with Validator {
  final _wallet1Controller =
      TextEditingController(text: MockWallets().getWallet(0));
  final _wallet2Controller =
      TextEditingController(text: MockWallets().getWallet(1));
  final _wallet3Controller =
      TextEditingController(text: MockWallets().getWallet(2));
  final _wallet4Controller =
      TextEditingController(text: MockWallets().getWallet(3));

  void _onConfirm() {
    _wallet1Controller.text;
    _wallet2Controller.text;
    _wallet3Controller.text;
    _wallet4Controller.text;
  }

  @override
  void dispose() {
    _wallet1Controller.dispose();
    _wallet2Controller.dispose();
    _wallet3Controller.dispose();
    _wallet4Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _LabeledField(
          controller: _wallet1Controller,
          validator: (p0) => validateField(p0, context),
          label: '${context.localizations.wallet} 1',
        ),
        const SizedBox(height: 16),
        _LabeledField(
          controller: _wallet2Controller,
          validator: (p0) => validateField(p0, context),
          label: '${context.localizations.wallet} 2',
        ),
        const SizedBox(height: 16),
        _LabeledField(
          controller: _wallet3Controller,
          validator: (p0) => validateField(p0, context),
          label: '${context.localizations.wallet} 3',
        ),
        const SizedBox(height: 16),
        _LabeledField(
          controller: _wallet4Controller,
          validator: (p0) => validateField(p0, context),
          label: '${context.localizations.wallet} 4',
        ),
        const SizedBox(height: 40),
        _AdminDialogButtons(
          onConfirm: _onConfirm,
          onCancel: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
