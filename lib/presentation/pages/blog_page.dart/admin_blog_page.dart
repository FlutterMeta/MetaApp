part of 'blog_page.dart';

class AdminBlogPage extends StatefulWidget {
  const AdminBlogPage({super.key});

  @override
  State<AdminBlogPage> createState() => _AdminBlogPageState();
}

class _AdminBlogPageState extends State<AdminBlogPage> with MessageOverlay {
  final _headerKey = GlobalKey();

  void _loadBlogPosts() async {
    context.read<BlogsNotifier>().blogs.clear();
    await context.read<BlogsNotifier>().loadBlogs();
  }

  @override
  void initState() {
    _loadBlogPosts();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
        return Center(
          child: SingleChildScrollView(
            child: Dialog(
              insetPadding: Responsive.isMobile(context)
                  ? const EdgeInsets.all(10)
                  : const EdgeInsets.all(100),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const _BlankPost(),
            ),
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
