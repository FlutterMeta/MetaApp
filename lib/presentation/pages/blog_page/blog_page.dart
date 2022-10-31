import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/constants/app_assets.dart';
import 'package:meta_app/presentation/widgets/footer/footer.dart';
import 'package:meta_app/presentation/widgets/header/header.dart';
import 'package:meta_app/presentation/widgets/hover.dart';
import 'package:meta_app/presentation/widgets/sliver_sized_box.dart';

part 'sections/presentation_section.dart';
part 'sections/post_section.dart';

class BlogPage extends StatelessWidget {
  final _headerKey = GlobalKey();

  BlogPage({super.key});

  double _getHeaderYOffset() {
    final renderSliver =
        _headerKey.currentContext?.findRenderObject() as RenderSliver;

    final yOffset = renderSliver.constraints.precedingScrollExtent +
        (renderSliver.geometry?.scrollExtent ?? 0);
    return yOffset;
  }

  static final examplePost = Post(
    title: "Office program for regional development leaders MultiMeta Universe",
    date: "19 September 2022, 07:10",
    body:
        "Due to the positive trend in the development of investment products from Meta Investments and the investment direction on the MultiMeta Universe NFT platform in particular, we announce the launch of a regional development program to popularize the direction of the metaverse product by opening consulting centers, representative branches, regional centers, and from February 2023 - VR stores with branded branded products from MultiMeta Universe in the Meta Investments ecosystem",
    image: AppAssets.decentralandImage,
  );
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
          /*  SliverSizedBox(
            child: Positioned(
              top: 10,
              child: _PostSection(post: examplePost),
            ),
          ), */
          /*  SliverSizedBox(
            child: Stack(
              clipBehavior: Clip.none,
              fit: StackFit.passthrough,
              children: [
                const _PresentationSection(),
                Positioned(
                  bottom: -400,
                  right: 0,
                  left: 0,
                  child: _PostSection(post: examplePost),
                ),
              ],
            ),
          ), */
          SliverToBoxAdapter(child: _PostSection(post: examplePost)),
          /*   SliverSizedBox(
            child: Stack(
              clipBehavior: Clip.none,
              fit: StackFit.passthrough,
              children: [
                const ColoredBox(color: Colors.white),
                Positioned(
                  top: -30,
                  right: 0,
                  left: 0,
                  child: _PostSection(post: examplePost),
                ),
              ],
            ),
          ), */
          const SliverToBoxAdapter(child: Footer()),
        ],
      ),
    );
  }
}


/* SliverSizedBox(
            child: Stack(
              children: [
                const _PresentationSection(),
                Positioned(
                  top: 100,
                  right: 0,
                  left: 0,
                  child: _PostSection(post: examplePost),
                ),
              ],
            ),
          ), */