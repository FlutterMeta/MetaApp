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
      body: ValueListenableBuilder(
        valueListenable: AdminBlogController.mode,
        builder: (context, value, child) {
          return CustomScrollView(
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
              if (AdminBlogController.mode.value == AdminBlogMode.show)
                const _ShowPostArea(),
              if (AdminBlogController.mode.value == AdminBlogMode.edit)
                const _EditablePostArea(),
              if (AdminBlogController.mode.value == AdminBlogMode.preview)
                const _PreviewPostArea(),
              const SliverSizedBox(height: 40),
              const SliverToBoxAdapter(child: Footer()),
            ],
          );
        },
      ),
    );
  }
}

class _MockPost {
  _MockPost._();
  static Post? previewPost;
  static Post post = Post(
    title: "Office program for regional development leaders Aurora Universe",
    body:
        "Due to the positive trend in the development of investment products from Meta Investments and the investment direction on the MultiMeta Universe NFT platform in particular, we announce the launch of a regional development program to popularize the direction of the metaverse product by opening consulting centers, representative branches, regional centers, and from February 2023 - VR stores with branded branded products from MultiMeta Universe in the Meta Investments ecosystem. \n- We present you an office program of regional development for active leaders with a priority development of investment products in the offline direction.",
    date: DateTime.now(),
  );

  static Post getPost() => post;
  static Post? getPreviewPost() => previewPost;
  static void writePost(Post newPost) => post = newPost;
  static void writePreviewPost(Post newPost) => previewPost = newPost;
}
