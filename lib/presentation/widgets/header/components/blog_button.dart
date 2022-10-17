part of "../header.dart";

class _BlogButton extends StatefulWidget {
  const _BlogButton({Key? key}) : super(key: key);

  @override
  State<_BlogButton> createState() => _BlogButtonState();
}

class _BlogButtonState extends State<_BlogButton> {
  bool _isHovered = false;

  void _onHover() {
    setState(() {
      _isHovered = !_isHovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (_) => _onHover(),
      onTap: () {},
      child: Text(
        context.localizations.blog,
        style:
            _isHovered ? context.text.blogTitleHovered : context.text.blogTitle,
      ),
    );
  }
}
