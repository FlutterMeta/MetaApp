part of '../blog_page.dart';

class _PostsSection extends StatefulWidget {
  const _PostsSection({Key? key}) : super(key: key);

  @override
  State<_PostsSection> createState() => __PostsSectionState();
}

class __PostsSectionState extends State<_PostsSection> {
  List<Blog> posts = _MockPosts.instance.posts;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _MockPosts.mockController,
      builder: (_, __, ___) {
        return ListView.separated(
          reverse: true,
          shrinkWrap: true,
          itemCount: posts.length,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (_, __) => const SizedBox(height: 40),
          itemBuilder: (_, index) => _SinglePostCard(post: posts[index]),
        );
      },
    );
  }
}
