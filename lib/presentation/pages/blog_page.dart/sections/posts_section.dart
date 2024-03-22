part of '../blog_page.dart';

class _PostsSection extends StatefulWidget {
  const _PostsSection({Key? key}) : super(key: key);

  @override
  State<_PostsSection> createState() => __PostsSectionState();
}

class __PostsSectionState extends State<_PostsSection> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BlogsNotifier>(
      builder: (_, blogsNotifier, __) {
        if (blogsNotifier.isLoading && blogsNotifier.blogs.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else if (blogsNotifier.blogs.isEmpty) {
          return Center(
              child:
                  MessageChip.info(message: context.localizations.noPostsYet));
        }
        return ListView.separated(
          reverse: true,
          shrinkWrap: true,
          itemCount: blogsNotifier.blogs.length,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (_, __) => const SizedBox(height: 40),
          itemBuilder: (_, index) =>
              _SinglePostCard(post: blogsNotifier.blogs[index]),
        );
      },
    );
  }
}
