part of "../blog_page.dart";

class _BlankPost extends StatefulWidget {
  final Blog? post;
  const _BlankPost({this.post, Key? key}) : super(key: key);

  @override
  State<_BlankPost> createState() => _BlankPostState();
}

class _BlankPostState extends State<_BlankPost> {
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  void _onAddTap() async {
    await _writePost();
    _clearControllers();
    BlogStateHandler.controller.value++;

    Navigator.of(context).pop();
  }

  void _onEditTap() async {
    await _editPost();
    _clearControllers();
    BlogStateHandler.controller.value++;

    Navigator.of(context).pop();
  }

  Future<void> _editPost() async {
    const String mockData = "mock data";
    final Uint8List mockBytes = Uint8List.fromList(mockData.codeUnits);
    final blog = Blog(
      id: widget.post?.id ?? 0,
      title: _titleController.text,
      content: _bodyController.text,
      url: "",
      image: base64Encode(mockBytes),
    );
    await apiRepository.updateBlogPost(blog.id, blog.toJson());

    BlogStateHandler.instance.editPost(blog);
  }

  Future<void> _writePost() async {
    const String mockData = "mock data";
    final Uint8List mockBytes = Uint8List.fromList(mockData.codeUnits);
    final blog = Blog(
      id: 0,
      title: _titleController.text,
      content: _bodyController.text,
      url: "",
      image: base64Encode(mockBytes),
    );
    await apiRepository.createBlogPost(blog.toJson());

    BlogStateHandler.instance.addPost(blog);
  }

  void _clearControllers() {
    _titleController.clear();
    _bodyController.clear();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.isMobile(context) ? 12 : 100,
        vertical: Responsive.isMobile(context) ? 20 : 100,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            context.localizations.createBlog,
            style: context.text.profilePageBody.copyWith(fontSize: 30),
          ),
          const SizedBox(height: 20),
          _EditablePostFields(
            post: widget.post,
            titleController: _titleController,
            bodyController: _bodyController,
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              ColoredButton(
                title: context.localizations.approveBlogArticle,
                onTap: widget.post == null ? _onAddTap : _onEditTap,
                color: context.color.profilePageSecondaryVariant,
              ),
              ColoredButton(
                title: context.localizations.cancel,
                onTap: () => Navigator.of(context).pop(),
                color: context.color.profilePageError,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _EditablePostFields extends StatelessWidget {
  final Blog? post;
  final TextEditingController titleController;
  final TextEditingController bodyController;

  const _EditablePostFields({
    this.post,
    required this.titleController,
    required this.bodyController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (post != null) {
      titleController.text = post?.title ?? "";
      bodyController.text = post?.content ?? "";
    }

    return Align(
      child: Container(
        padding: const EdgeInsets.all(20),
        constraints: const BoxConstraints(maxWidth: 1000),
        decoration: BoxDecoration(
          color: context.color.postBackground,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: context.color.postShadow,
              blurRadius: 30,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            TextField(
              controller: titleController,
              style: context.text.blogPostHeadline,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: context.localizations.blogTitle,
                hintStyle: context.text.profilePageBody.copyWith(fontSize: 24),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: bodyController,
              minLines: 16,
              maxLines: 30,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: context.localizations.blogBody,
                hintStyle: context.text.profilePageBody.copyWith(fontSize: 16),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
