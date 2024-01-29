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

  void _goToBlogPage(BuildContext context) {
    context.router.navigate(const BlogRoute());
  }

  void _goToAdminBlogPage(BuildContext context) {
    context.router.navigate(const AdminBlogRoute());
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, User?>(
      converter: (store) => store.state.currentUser,
      builder: (context, currentUser) {
        return InkWell(
          onHover: (_) => _onHover(),
          onTap: () {
            currentUser?.role == UserRole.user || currentUser == null
                ? _goToBlogPage(context)
                : _goToAdminBlogPage(context);
          },
          child: Text(
            context.localizations.blog,
            style: _isHovered
                ? context.text.blogTitleHovered
                : context.text.blogTitle,
          ),
        );
      },
    );
  }
}
