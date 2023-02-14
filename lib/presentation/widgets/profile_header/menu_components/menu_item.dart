part of '../menu.dart';

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
