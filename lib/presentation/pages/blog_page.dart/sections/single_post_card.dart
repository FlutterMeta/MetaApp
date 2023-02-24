part of "../blog_page.dart";

class _SinglePostCard extends StatelessWidget {
  final Post post;

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
  final Post post;

  const _HoverablePost({
    required this.post,
    Key? key,
  }) : super(key: key);

  @override
  State<_HoverablePost> createState() => __HoverablePostState();
}

class __HoverablePostState extends State<_HoverablePost> {
  bool _isHovered = false;

  String _formatDate(DateTime date) {
    final DateFormat formatter = DateFormat("d MMM y, hh:mm");
    final String formatted = formatter.format(date);
    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    return _HoveredPost(
      builder: (_) {
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
                Text(
                  "${_formatDate(widget.post.date)} ${context.localizations.publicationDate}",
                  style: context.text.blogPostSubHeadline,
                ),
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.centerLeft,
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Text(
                    widget.post.title,
                    style: context.text.blogPostHeadline,
                  ),
                ),
                const SizedBox(height: 20),
                Text(widget.post.body),
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
                      _PostLink(
                        isHovered: _isHovered,
                        text: context.localizations.newsChannelInTelegram,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
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
