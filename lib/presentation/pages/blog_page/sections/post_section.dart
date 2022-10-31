part of '../blog_page.dart';

class _PostSection extends StatefulWidget {
  final Post post;

  const _PostSection({Key? key, required this.post}) : super(key: key);

  @override
  State<_PostSection> createState() => _PostSectionState();
}

class _PostSectionState extends State<_PostSection> {
  bool _isHovered = false;

  void _onEntered(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: Transform(
        transform: Matrix4.identity()..translate(0, -120, 0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 6,
              ),
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          constraints: const BoxConstraints(maxWidth: 1270),
          padding: const EdgeInsets.all(26),
          child: _OnPostHover(
            builder: (_) {
              return MouseRegion(
                onEnter: (_) => _onEntered(true),
                onExit: (_) => _onEntered(false),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: _isHovered
                        ? Border.all(color: Colors.deepPurple)
                        : Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[300],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.post.date} | Publication date",
                        style: context.text.blogSubHeadline,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        widget.post.title,
                        style: context.text.blogHeadline,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        widget.post.body,
                        style: context.text.blogSubHeadline,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class Post {
  final String date;
  final String title;
  final String body;
  final String? image;

  Post({
    required this.date,
    required this.title,
    required this.body,
    this.image = "",
  });
}

class _OnPostHover extends StatefulWidget {
  final Widget Function(bool isHovered) builder;

  const _OnPostHover({
    required this.builder,
    Key? key,
  }) : super(key: key);

  @override
  _OnPostHoverState createState() => _OnPostHoverState();
}

class _OnPostHoverState extends State<_OnPostHover> {
  bool _isHovered = false;

  void _onEntered(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }

  Matrix4 _transform() {
    final hovered = Matrix4.identity()..translate(0, -10, 0);
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
