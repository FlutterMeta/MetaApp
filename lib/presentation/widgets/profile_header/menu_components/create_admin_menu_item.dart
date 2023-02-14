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
  final _mailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _onConfirm() {
    _mailController.text;
    _nameController.text;
    _passwordController.text;
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
              context.localizations.createAdmin,
              style: context.text.profileBotsDefault.copyWith(fontSize: 20),
            ),
            const SizedBox(height: 20),
            _AdminCreationFields(
              mailController: _mailController,
              nameController: _nameController,
              passwordController: _passwordController,
            ),
            const SizedBox(height: 40),
            _AdminDialogButtons(
              onConfirm: _onConfirm,
              onCancel: () => Navigator.of(context).pop(),
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
      title: context.localizations.createAdmin,
      icon: Icons.edit_rounded,
      color: context.color.profilePagePrimaryVariant,
    );
  }
}

class _AdminCreationFields extends StatelessWidget {
  final TextEditingController mailController;
  final TextEditingController nameController;
  final TextEditingController passwordController;

  const _AdminCreationFields({
    required this.mailController,
    required this.nameController,
    required this.passwordController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _LabeledField(
          controller: mailController,
          label: context.localizations.email,
        ),
        const SizedBox(height: 16),
        _LabeledField(
          controller: nameController,
          label: context.localizations.nickname,
        ),
        const SizedBox(height: 16),
        _LabeledField(
          controller: passwordController,
          label: context.localizations.password,
        ),
      ],
    );
  }
}
