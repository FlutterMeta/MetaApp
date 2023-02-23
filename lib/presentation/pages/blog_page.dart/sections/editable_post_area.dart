part of "../blog_page.dart";

class _EditablePostArea extends StatefulWidget {
  const _EditablePostArea({Key? key}) : super(key: key);

  @override
  State<_EditablePostArea> createState() => __EditablePostAreaState();
}

class __EditablePostAreaState extends State<_EditablePostArea> {
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  @override
  void initState() {
    final post = _MockPost.getPost();
    _titleController.text = post.title;
    _bodyController.text = post.body;
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  void _handleTap() {
    writePreviewPost();
    AdminBlogController.mode.value = AdminBlogMode.preview;
  }

  void writePreviewPost() {
    _MockPost.writePreviewPost(
      Post(
        title: _titleController.text,
        body: _bodyController.text,
        date: DateTime.now(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverSizedBox(
      child: Column(
        children: [
          Text(
            context.localizations.editing.toUpperCase(),
            style: context.text.profilePageBody.copyWith(fontSize: 30),
          ),
          const SizedBox(height: 20),
          _EditablePostSection(
            titleController: _titleController,
            bodyController: _bodyController,
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              ColoredButton(
                title: context.localizations.addBlogArticle,
                onTap: _handleTap,
                color: context.color.profilePagePrimary,
              ),
              ColoredButton(
                title: context.localizations.cancel,
                onTap: () =>
                    AdminBlogController.mode.value = AdminBlogMode.show,
                color: context.color.profilePageError,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
