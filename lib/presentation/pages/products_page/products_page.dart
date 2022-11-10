import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/constants/app_assets.dart';
import 'package:meta_app/presentation/widgets/footer/footer.dart';
import 'package:meta_app/presentation/widgets/gradient_button.dart';
import 'package:meta_app/presentation/widgets/header/header.dart';
import 'package:meta_app/presentation/widgets/hover.dart';
import 'package:meta_app/presentation/widgets/sliver_sized_box.dart';

part 'sections/products_section.dart';
part 'sections/presentation_section.dart';
part 'sections/investors_section.dart';
part 'sections/trusted_section.dart';
part 'sections/components_section.dart';
part 'sections/partners_section.dart';
part 'sections/faq_section.dart';
part 'sections/promotion_section.dart';

class ProductsPage extends StatelessWidget {
  final _headerKey = GlobalKey();

  ProductsPage({super.key});

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
          const SliverSizedBox(child: _ProductsSection()),
          const SliverSizedBox(child: _PresentationSection()),
          const SliverSizedBox(height: 60),
          const SliverToBoxAdapter(child: _Divider()),
          const SliverSizedBox(height: 20),
          const SliverSizedBox(child: _InvestorsSection()),
          const SliverSizedBox(height: 100),
          const SliverToBoxAdapter(child: _TrustedSection()),
          const SliverSizedBox(height: 100),
          const SliverToBoxAdapter(child: _ComponentsSection()),
          const SliverSizedBox(height: 100),
          const SliverToBoxAdapter(child: _PartnersSection()),
          const SliverSizedBox(height: 100),
          const SliverToBoxAdapter(child: _FaqSection()),
          const SliverSizedBox(height: 60),
          const SliverToBoxAdapter(child: _PromotionSection()),
          const SliverSizedBox(height: 40),
          const SliverToBoxAdapter(child: Footer()),
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1270),
        child: const Divider(),
      ),
    );
  }
}
