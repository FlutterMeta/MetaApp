part of "../blog_page.dart";

class _PreviewPostArea extends StatelessWidget {
  const _PreviewPostArea({
    Key? key,
  }) : super(key: key);

  void _handleTap() {
    writePost();
    AdminBlogController.mode.value = AdminBlogMode.show;
  }

  void writePost() => _MockPost.writePost(_MockPost.getPreviewPost() as Post);

  @override
  Widget build(BuildContext context) {
    return SliverSizedBox(
      child: Column(
        children: [
          _PostSection(
            post: _MockPost.getPreviewPost() ?? _MockPost.getPost(),
          ),
          const SizedBox(height: 20),
          ColoredButton(
            title: context.localizations.approveBlogArticle,
            onTap: _handleTap,
            color: context.color.profilePageSecondaryVariant,
          ),
        ],
      ),
    );
  }
}
