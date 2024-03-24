import 'dart:convert';
import 'dart:typed_data';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:meta_app/core/mixins/message_overlay.dart';

import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/data/models/result.dart';

import 'package:meta_app/presentation/providers/blogs_notifier.dart';
import 'package:meta_app/presentation/widgets/colored_button.dart';
import 'package:meta_app/presentation/widgets/footer/footer.dart';
import 'package:meta_app/presentation/widgets/header/header.dart';
import 'package:meta_app/presentation/widgets/hover.dart';
import 'package:meta_app/presentation/widgets/message_chip.dart';
import 'package:meta_app/presentation/widgets/sliver_sized_box.dart';
import 'package:meta_app/presentation/widgets/web_button.dart';
import 'package:provider/provider.dart';

import '../../../data/models/blog.dart';
import '../../../data/models/user.dart';
import '../../redux/app_state.dart';
import '../../widgets/responsive.dart';

part 'sections/presentation_section.dart';
part 'sections/single_post_card.dart';
part 'sections/welcome_section.dart';
part 'sections/blank_post.dart';
part 'sections/posts_section.dart';
part './admin_blog_page.dart';
part 'date_time_ext.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  final _headerKey = GlobalKey();

  void _loadBlogPosts() async {
    context.read<BlogsNotifier>().blogs.clear();
    await context.read<BlogsNotifier>().loadBlogs();
  }

  @override
  void initState() {
    super.initState();
    _loadBlogPosts();
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
          const SliverSizedBox(child: _PresentationSection()),
          const SliverSizedBox(height: 20),
          const SliverSizedBox(child: _PostsSection()),
          const SliverSizedBox(height: 40),
          const SliverSizedBox(child: _WelcomeSection()),
          const SliverToBoxAdapter(child: Footer()),
        ],
      ),
    );
  }
}
