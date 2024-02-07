part of '../blog_page.dart';

class _PostsSection extends StatefulWidget {
  const _PostsSection({Key? key}) : super(key: key);

  @override
  State<_PostsSection> createState() => __PostsSectionState();
}

class __PostsSectionState extends State<_PostsSection> {
  List<Blog> posts = BlogStateHandler.instance.posts;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: BlogStateHandler.controller,
      builder: (_, __, ___) {
        if (posts.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
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
