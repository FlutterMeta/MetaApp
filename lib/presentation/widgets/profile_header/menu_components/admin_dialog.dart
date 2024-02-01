part of '../menu.dart';

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
