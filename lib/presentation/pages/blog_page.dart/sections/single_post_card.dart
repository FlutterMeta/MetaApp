part of "../blog_page.dart";

class _SinglePostCard extends StatelessWidget {
  final Blog post;

  const _SinglePostCard({
    required this.post,
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
        child: _HoverablePost(post: post),
      ),
    );
  }
}

class _HoverablePost extends StatefulWidget {
  final Blog post;

  const _HoverablePost({
    required this.post,
    Key? key,
  }) : super(key: key);

  @override
  State<_HoverablePost> createState() => __HoverablePostState();
}

class __HoverablePostState extends State<_HoverablePost> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return _HoveredPost(
      builder: (_) {
        return StoreConnector<AppState, User?>(
          converter: (store) => store.state.currentUser,
          builder: (context, currentUser) {
            return MouseRegion(
              onEnter: (_) => setState(() => _isHovered = !_isHovered),
              onExit: (_) => setState(() => _isHovered = !_isHovered),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: context.color.blogPostBackground,
                  border: _isHovered
                      ? Border.all(color: context.color.blogPostBorderHovered)
                      : Border.all(color: context.color.blogPostBorder),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      alignment: Alignment.centerLeft,
                      constraints: const BoxConstraints(maxWidth: 800),
                      child: Text(
                        widget.post.title ?? "Blog post title",
                        style: context.text.blogPostHeadline,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "${DateFormat.jm().format(widget.post.createDate)} | ${DateFormat.yMMMd().format(widget.post.createDate)} UTC",
                      style: context.text.blogPostLink,
                    ),
                    const SizedBox(height: 20),
                    Text(widget.post.content ?? "Blog post content"),
                    const SizedBox(height: 60),
                    SizedBox(
                      width: double.infinity,
                      child: Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        crossAxisAlignment: WrapCrossAlignment.end,
                        runSpacing: 20,
                        spacing: 20,
                        children: [
                          const SizedBox(),
                          // _PostLink(
                          //   isHovered: _isHovered,
                          //   text: context.localizations.newsChannelInTelegram,
                          //   onTap: () {},
                          // ),
                          currentUser?.role == UserRole.admin ||
                                  currentUser?.role == UserRole.adam
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    _EditPostButton(post: widget.post),
                                    const SizedBox(width: 20),
                                    _DeletePostButton(postId: widget.post.id),
                                  ],
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _DeletePostButton extends StatelessWidget {
  final int postId;
  const _DeletePostButton({required this.postId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredButton(
      color: context.color.profilePageError,
      title: context.localizations.deletePost,
      onTap: () {
        context.read<BlogsNotifier>().deleteBlog(postId);
      },
    );
  }
}

class _EditPostButton extends StatelessWidget {
  final Blog post;
  const _EditPostButton({required this.post, Key? key}) : super(key: key);
  Future<void> _pushDialog(BuildContext context, Blog post) {
    return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: SingleChildScrollView(
            child: Dialog(
              insetPadding: Responsive.isMobile(context)
                  ? const EdgeInsets.all(10)
                  : const EdgeInsets.all(100),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: _BlankPost(post: post),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ColoredButton(
      color: context.color.profilePageSecondaryVariant,
      title: context.localizations.editPost,
      onTap: () {
        _pushDialog(context, post);
      },
    );
  }
}

class _PostLink extends StatefulWidget {
  final bool isHovered;
  final VoidCallback onTap;
  final String text;

  const _PostLink({
    required this.isHovered,
    required this.onTap,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  State<_PostLink> createState() => __PostLinkState();
}

class __PostLinkState extends State<_PostLink> {
  @override
  Widget build(BuildContext context) {
    return WebButton(
      onTap: widget.onTap,
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 200),
        style: widget.isHovered
            ? context.text.blogPostLinkHovered
            : context.text.blogPostLink,
        child: Text(widget.text),
      ),
    );
  }
}

class _HoveredPost extends StatefulWidget {
  final Widget Function(bool isHovered) builder;

  const _HoveredPost({
    required this.builder,
    Key? key,
  }) : super(key: key);

  @override
  _HoveredPostState createState() => _HoveredPostState();
}

class _HoveredPostState extends State<_HoveredPost> {
  bool _isHovered = false;

  void _onEntered(bool isHovered) {
    setState(() => _isHovered = isHovered);
  }

  Matrix4 _transform() {
    final hovered = Matrix4.identity()..translate(0, -8, 0);
    return _isHovered ? hovered : Matrix4.identity();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onEntered(true),
      onExit: (_) => _onEntered(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: _transform(),
        child: widget.builder(_isHovered),
      ),
    );
  }
}
