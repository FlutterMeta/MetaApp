import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/widgets/colored_button.dart';

import '../../navigation/app_router.gr.dart';

class Menu extends StatelessWidget {
  final List<Widget> Function(BuildContext context, VoidCallback closeOnTap)
      items;
  final Animation<double>? animation;
  final VoidCallback onCloseItemTap;

  const Menu({
    required this.items,
    required this.animation,
    required this.onCloseItemTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.color.localeDropdownOpacity,
      child: FadeTransition(
        opacity: animation as Animation<double>,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: context.color.profilePageBackground,
            boxShadow: [
              BoxShadow(
                color: context.color.profilePagePrimary.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...items(context, onCloseItemTap),
                _MenuItem(
                  onTap: () => context.router.push(const LoginRoute()),
                  closeMenuCallback: onCloseItemTap,
                  title: context.localizations.signOut,
                  icon: Icons.logout_rounded,
                  color: context.color.profilePageError,
                ),
                _MenuItem(
                  onTap: () => onCloseItemTap(),
                  title: context.localizations.closeMenu,
                  icon: Icons.close_rounded,
                  color: context.color.greyish,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileMenu extends Menu {
  static List<Widget> _adminMenuItems(
    BuildContext context,
    VoidCallback closeOnTap,
  ) {
    return [
      _MenuItem(
        onTap: () => context.router.push(BlogRoute()),
        closeMenuCallback: closeOnTap,
        title: context.localizations.updateBlog,
        icon: Icons.table_chart_rounded,
        color: context.color.profilePagePrimaryVariant,
      ),
      _MenuItem(
        onTap: () => context.router.push(const TransactionsRoute()),
        closeMenuCallback: closeOnTap,
        title: context.localizations.allTransactions,
        icon: Icons.list_alt,
        color: context.color.profilePagePrimaryVariant,
      ),
      _MenuItem(
        onTap: () => context.router.push(const FinancialIndicatorsRoute()),
        title: context.localizations.financialResults,
        closeMenuCallback: closeOnTap,
        icon: Icons.pie_chart_rounded,
        color: context.color.profilePagePrimaryVariant,
      ),
      _EditRequisitesMenuItem(closeMenuCallback: closeOnTap),
      _CreateAdminMenuItem(closeMenuCallback: closeOnTap),
    ];
  }

  const ProfileMenu({
    required List<Widget> Function(BuildContext, VoidCallback) items,
    required Animation<double>? animation,
    required VoidCallback onCloseItemTap,
    Key? key,
  }) : super(
          items: items,
          animation: animation,
          onCloseItemTap: onCloseItemTap,
          key: key,
        );

  factory ProfileMenu.client({
    required Animation<double>? animation,
    required VoidCallback onCloseItemTap,
    Key? key,
  }) =>
      ProfileMenu(
        items: (_, __) => [],
        animation: animation,
        onCloseItemTap: onCloseItemTap,
        key: key,
      );

  factory ProfileMenu.admin({
    required Animation<double>? animation,
    required VoidCallback onCloseItemTap,
    Key? key,
  }) =>
      ProfileMenu(
        items: _adminMenuItems,
        animation: animation,
        onCloseItemTap: onCloseItemTap,
        key: key,
      );
}

class _CreateAdminMenuItem extends StatefulWidget {
  final VoidCallback closeMenuCallback;

  const _CreateAdminMenuItem({
    required this.closeMenuCallback,
    Key? key,
  }) : super(key: key);

  @override
  State<_CreateAdminMenuItem> createState() => _CreateAdminMenuItemState();
}

class _CreateAdminMenuItemState extends State<_CreateAdminMenuItem> {
  void _showDialog() {
    widget.closeMenuCallback.call();
    showDialog(
      context: context,
      builder: (context) => _AdminDialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.localizations.createAdmin,
              style: context.text.profileBotsDefault.copyWith(fontSize: 20),
            ),
            const SizedBox(height: 20),
            const _AdminCreationFields(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _MenuItem(
      onTap: _showDialog,
      title: context.localizations.createAdmin,
      icon: Icons.edit_rounded,
      color: context.color.profilePagePrimaryVariant,
    );
  }
}

class _AdminDialog extends StatelessWidget {
  final Widget child;

  const _AdminDialog({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: const EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.screenWidth < 400 ? 16 : 30,
          vertical: 30,
        ),
        constraints: const BoxConstraints(maxWidth: 600),
        child: child,
      ),
    );
  }
}

class _AdminDialogButtons extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const _AdminDialogButtons({
    required this.onConfirm,
    required this.onCancel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        ColoredButton(
          title: context.localizations.create,
          onTap: onConfirm,
          color: context.color.profilePageSecondaryVariant,
        ),
        const SizedBox(width: 10),
        ColoredButton(
          title: context.localizations.cancel,
          onTap: onCancel,
          color: context.color.profilePageError,
        ),
      ],
    );
  }
}

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

class _RequisitesFieldsState extends State<_RequisitesFields> {
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _LabeledField(
          controller: _wallet1Controller,
          label: '${context.localizations.wallet} 1',
        ),
        const SizedBox(height: 16),
        _LabeledField(
          controller: _wallet2Controller,
          label: '${context.localizations.wallet} 2',
        ),
        const SizedBox(height: 16),
        _LabeledField(
          controller: _wallet3Controller,
          label: '${context.localizations.wallet} 3',
        ),
        const SizedBox(height: 16),
        _LabeledField(
          controller: _wallet4Controller,
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

class _AdminCreationFields extends StatefulWidget {
  const _AdminCreationFields({Key? key}) : super(key: key);

  @override
  State<_AdminCreationFields> createState() => _AdminCreationFieldsState();
}

class _AdminCreationFieldsState extends State<_AdminCreationFields> {
  final _mailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _onConfirm() {
    _mailController.text;
    _nameController.text;
    _passwordController.text;
  }

  @override
  void dispose() {
    _mailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _LabeledField(
          controller: _mailController,
          label: context.localizations.email,
        ),
        const SizedBox(height: 16),
        _LabeledField(
          controller: _nameController,
          label: context.localizations.nickname,
        ),
        const SizedBox(height: 16),
        _LabeledField(
          controller: _passwordController,
          label: context.localizations.password,
        ),
        const SizedBox(height: 16),
        _AdminDialogButtons(
          onConfirm: _onConfirm,
          onCancel: () => Navigator.pop(context),
        ),
      ],
    );
  }
}

class _LabeledField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const _LabeledField({
    required this.label,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            "$label:",
            style: context.text.profileBotsDefault.copyWith(fontSize: 16),
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: context.screenWidth < 600 ? 200 : 300,
          child: TextField(
            controller: controller,
            style: context.text.profileBotsDefault.copyWith(fontSize: 16),
            decoration: InputDecoration(
              filled: true,
              fillColor: context.color.profilePagePrimary.withOpacity(0.2),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _MenuItem extends StatefulWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final VoidCallback? closeMenuCallback;

  const _MenuItem({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
    this.closeMenuCallback,
    Key? key,
  }) : super(key: key);

  @override
  State<_MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<_MenuItem> {
  bool _isHovered = false;

  void handleTap() {
    if (widget.closeMenuCallback != null) {
      widget.closeMenuCallback?.call();
    }
    Future.delayed(const Duration(milliseconds: 300), () => widget.onTap());
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: handleTap,
      onHover: (isHovered) => setState(() => _isHovered = isHovered),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:
              _isHovered ? widget.color : context.color.profilePageBackground,
        ),
        constraints: const BoxConstraints(minWidth: 190),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            const SizedBox(width: 6),
            Icon(
              widget.icon,
              color: _isHovered
                  ? context.color.profilePageBackground
                  : widget.color,
            ),
            const SizedBox(width: 6),
            Text(
              widget.title,
              style: TextStyle(
                color: _isHovered
                    ? context.color.profilePageBackground
                    : widget.color,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
