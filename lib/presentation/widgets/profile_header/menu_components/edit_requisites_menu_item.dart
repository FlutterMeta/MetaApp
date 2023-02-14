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

final List<String> _mockWallets = [
  "Tw9a8zmv6c4u2rk1w3o0f12c63hs2saq",
  "15LXEMoaAw63TKUkob3QWzrMzmgDA7Vpex",
  "1LQoWist8KkaUXSPKZHNvEyfrEkPHzSsCd",
  "TBia4uHnb3oSSZm5isP284cA7Np1v15Vhi",
];

class _EditRequisitesMenuItemState extends State<_EditRequisitesMenuItem> {
  final _wallet1Controller = TextEditingController(text: _mockWallets.first);
  final _wallet2Controller = TextEditingController(text: _mockWallets[1]);
  final _wallet3Controller = TextEditingController(text: _mockWallets[2]);
  final _wallet4Controller = TextEditingController(text: _mockWallets.last);

  void _onConfirm() {
    _wallet1Controller.text;
    _wallet2Controller.text;
    _wallet3Controller.text;
    _wallet4Controller.text;
  }

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
            _RequisitesFields(
              wallet1Controller: _wallet1Controller,
              wallet2Controller: _wallet2Controller,
              wallet3Controller: _wallet3Controller,
              wallet4Controller: _wallet4Controller,
            ),
            const SizedBox(height: 40),
            _AdminDialogButtons(
              onConfirm: _onConfirm,
              onCancel: () => Navigator.pop(context),
            ),
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

class _RequisitesFields extends StatelessWidget {
  final TextEditingController wallet1Controller;
  final TextEditingController wallet2Controller;
  final TextEditingController wallet3Controller;
  final TextEditingController wallet4Controller;

  const _RequisitesFields({
    required this.wallet1Controller,
    required this.wallet2Controller,
    required this.wallet3Controller,
    required this.wallet4Controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _LabeledField(
          controller: wallet1Controller,
          label: '${context.localizations.wallet} 1',
        ),
        const SizedBox(height: 16),
        _LabeledField(
          controller: wallet2Controller,
          label: '${context.localizations.wallet} 2',
        ),
        const SizedBox(height: 16),
        _LabeledField(
          controller: wallet3Controller,
          label: '${context.localizations.wallet} 3',
        ),
        const SizedBox(height: 16),
        _LabeledField(
          controller: wallet4Controller,
          label: '${context.localizations.wallet} 4',
        ),
      ],
    );
  }
}
