part of 'blog_page.dart';

class AdminBlogPage extends StatelessWidget {
  AdminBlogPage({super.key});

  final _headerKey = GlobalKey();

  double _getHeaderYOffset() {
    final renderSliver =
        _headerKey.currentContext?.findRenderObject() as RenderSliver;

    final yOffset = renderSliver.constraints.precedingScrollExtent +
        (renderSliver.geometry?.scrollExtent ?? 0);
    return yOffset;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.profilePageBackground,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            key: _headerKey,
            delegate: Header(
              headerYOffset: _getHeaderYOffset,
              screenWidth: context.screenWidth,
            ),
            pinned: true,
          ),
          const SliverSizedBox(height: 70),
          const SliverSizedBox(child: _PresentationSection()),
          const SliverSizedBox(height: 20),
          const SliverSizedBox(child: _CreatePostSection()),
          const SliverSizedBox(height: 20),
          const SliverSizedBox(child: _PostsSection()),
          const SliverSizedBox(height: 40),
          const SliverToBoxAdapter(child: Footer()),
        ],
      ),
    );
  }
}

class _CreatePostSection extends StatefulWidget {
  const _CreatePostSection({Key? key}) : super(key: key);

  @override
  State<_CreatePostSection> createState() => _CreatePostSectionState();
}

class _CreatePostSectionState extends State<_CreatePostSection> {
  Future<void> _pushDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Dialog(
            insetPadding: Responsive.isMobile(context)
                ? const EdgeInsets.all(10)
                : const EdgeInsets.all(100),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: const _BlankPost(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 200),
        child: ColoredButton(
          color: context.color.profilePagePrimary,
          title: context.localizations.addBlogArticle,
          onTap: () => _pushDialog(context),
        ),
      ),
    );
  }
}

class _MockPosts {
  static _MockPosts get instance => _singleton;
  static final _MockPosts _singleton = _MockPosts._internal();
  _MockPosts._internal();

  static final ValueNotifier<int> _mockController = ValueNotifier(0);
  static ValueNotifier<int> get mockController => _mockController;

  List<Post> get posts => _posts;
  void addPost(Post post) => _posts.add(post);

  final List<Post> _posts = [
    Post(
      title: 'Post 1',
      body: 'Lorem Ipsum Content 1' * 30,
      date: DateTime.now(),
    ),
    Post(
      title: 'Post 2',
      body: 'Lorem Ipsum Content 2' * 30,
      date: DateTime.now(),
    ),
    Post(
      title: 'Post 3',
      body: 'Lorem Ipsum Content 3' * 30,
      date: DateTime.now(),
    ),
  ];
}
