import 'dart:convert';
import 'dart:typed_data';

import 'package:async_redux/async_redux.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:meta_app/core/global.dart';
import 'package:meta_app/core/utils/api_client.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/domain/repositories/api_repository.dart';
import 'package:meta_app/presentation/constants/app_assets.dart';
import 'package:meta_app/presentation/widgets/colored_button.dart';
import 'package:meta_app/presentation/widgets/footer/footer.dart';
import 'package:meta_app/presentation/widgets/header/header.dart';
import 'package:meta_app/presentation/widgets/hover.dart';
import 'package:meta_app/presentation/widgets/sliver_sized_box.dart';
import 'package:meta_app/presentation/widgets/web_button.dart';

import '../../../data/models/blog.dart';
import '../../../data/models/user.dart';
import '../../redux/app_state.dart';
import '../../widgets/responsive.dart';
import 'blog_state_handler.dart';

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
    Response posts = await apiRepository.getBlogPosts();
    BlogStateHandler.instance.posts.clear();
    for (var post in posts.data["\$values"]) {
      BlogStateHandler.instance.addPost(Blog.fromJson(post));
      BlogStateHandler.controller.value++;
    }
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
      backgroundColor: Colors.white,
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
          const SliverSizedBox(child: _PostsSection()),
          const SliverSizedBox(height: 40),
          const SliverSizedBox(child: _WelcomeSection()),
          const SliverToBoxAdapter(child: Footer()),
        ],
      ),
    );
  }
}
