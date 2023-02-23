part of "../blog_page.dart";

class _ShowPostArea extends StatelessWidget {
  const _ShowPostArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverSizedBox(
      child: Column(
        children: [
          _PostSection(post: _MockPost.getPost()),
          const SizedBox(height: 20),
          ColoredButton(
            title: context.localizations.edit,
            onTap: () => AdminBlogController.mode.value = AdminBlogMode.edit,
            color: context.color.profilePageSecondary,
          ),
        ],
      ),
    );
  }
}
