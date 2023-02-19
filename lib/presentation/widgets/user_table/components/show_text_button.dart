part of '../user_table.dart';

class _ShowTextButton extends StatefulWidget {
  final VoidCallback onTap;

  const _ShowTextButton({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  State<_ShowTextButton> createState() => _ShowTextButtonState();
}

class _ShowTextButtonState extends State<_ShowTextButton> {
  bool _isHovered = false;

  Color _getTextColor(BuildContext context) {
    if (_isHovered) {
      return context.color.profilePagePrimary.withOpacity(0.7);
    } else {
      return context.color.profilePagePrimary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: Container(
          padding: const EdgeInsets.only(bottom: 2),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: _getTextColor(context),
                width: 1,
              ),
            ),
          ),
          child: Text(
            context.localizations.show,
            style: context.text.adminUserTableLabel
                .copyWith(color: _getTextColor(context)),
          ),
        ),
      ),
    );
  }
}
