part of "../blog_page.dart";

class _BlankPost extends StatefulWidget {
  const _BlankPost({Key? key}) : super(key: key);

  @override
  State<_BlankPost> createState() => _BlankPostState();
}

class _BlankPostState extends State<_BlankPost> {
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  void _onAddTap() {
    _writePost();
    _clearControllers();
    _MockPosts._mockController.value++;
    Navigator.of(context).pop();
  }

  void _writePost() {
    final String mockData = "mock data";
    final Uint8List mockBytes = Uint8List.fromList(mockData.codeUnits);
    final blog = Blog(
      id: 0,
      title: _titleController.text,
      content: _bodyController.text,
      url: "",
      image: base64Encode(mockBytes),
    );
    apiRepository.createBlogPost(blog.toJson());
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
                onTap: _onAddTap,
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
  final TextEditingController titleController;
  final TextEditingController bodyController;

  const _EditablePostFields({
    required this.titleController,
    required this.bodyController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
