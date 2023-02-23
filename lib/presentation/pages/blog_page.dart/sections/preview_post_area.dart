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
          Text(
            context.localizations.preview.toUpperCase(),
            style: context.text.profilePageBody.copyWith(fontSize: 30),
          ),
          const SizedBox(height: 20),
          _PostSection(
            post: _MockPost.getPreviewPost() ?? _MockPost.getPost(),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              ColoredButton(
                title: context.localizations.approveBlogArticle,
                onTap: _handleTap,
                color: context.color.profilePageSecondaryVariant,
              ),
              ColoredButton(
                title: context.localizations.cancel,
                onTap: () =>
                    AdminBlogController.mode.value = AdminBlogMode.edit,
                color: context.color.profilePageError,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
