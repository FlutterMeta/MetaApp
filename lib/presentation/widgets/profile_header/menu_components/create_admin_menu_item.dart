part of '../menu.dart';

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
        const SizedBox(height: 40),
        _AdminDialogButtons(
          onConfirm: _onConfirm,
          onCancel: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
