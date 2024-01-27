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

class _AdminCreationFieldsState extends State<_AdminCreationFields>
    with Validator {
  final _mailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _registerAdmin() {
    final Registration register = Registration(
      email: _mailController.text,
      login: _nameController.text,
      password: _passwordController.text,
      phoneNumber: "3800000000000",
    );
    apiRepository.registerAdmin(register);
  }

  void _showSuccessMessage() {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height *
            0.1, // Adjust the position as needed
        left: MediaQuery.of(context).size.width * 0.1,
        child: Material(
          elevation: 10.0,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.all(16),
            color: Colors.green, // You can style this as you want
            child: const Text(
              'Admin added successfully',
              style: TextStyle(
                  color: Colors.white), // And style this text as you want
            ),
          ),
        ),
      ),
    );

    overlay?.insert(overlayEntry);

    // Automatically remove the overlay after 2 seconds
    Future.delayed(const Duration(seconds: 2))
        .then((value) => overlayEntry.remove());
  }

  void _onConfirm() {
    if (_formKey.currentState?.validate() ?? false) {
      _showSuccessMessage();
      _registerAdmin();
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _mailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _LabeledField(
            controller: _mailController,
            validator: (email) => validateEmail(email, context),
            hint: context.localizations.email,
            label: context.localizations.email,
          ),
          const SizedBox(height: 16),
          _LabeledField(
            controller: _nameController,
            validator: (name) => validateLogin(name, context),
            hint: context.localizations.nickname,
            label: context.localizations.nickname,
          ),
          const SizedBox(height: 16),
          _LabeledField(
            controller: _passwordController,
            validator: (password) => validatePassword(password, context),
            hint: context.localizations.password,
            label: context.localizations.password,
          ),
          const SizedBox(height: 40),
          _AdminDialogButtons(
            onConfirm: _onConfirm,
            onCancel: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
