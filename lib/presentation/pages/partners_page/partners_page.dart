import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/constants/app_assets.dart';
import 'package:meta_app/presentation/widgets/footer/footer.dart';
import 'package:meta_app/presentation/widgets/gradient_background.dart';
import 'package:meta_app/presentation/widgets/gradient_button.dart';
import 'package:meta_app/presentation/widgets/header/header.dart';
import 'package:meta_app/presentation/widgets/hover.dart';
import 'package:meta_app/presentation/widgets/sliver_sized_box.dart';
import 'package:meta_app/presentation/widgets/web_button.dart';
import 'package:video_player/video_player.dart';

part 'sections/cards_section.dart';
part 'sections/income_section.dart';
part 'sections/become_partner_section.dart';
part 'sections/table_section.dart';
part 'sections/pdf_section.dart';

class PartnersPage extends StatelessWidget {
  final _headerKey = GlobalKey();

  PartnersPage({super.key});

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
          const SliverToBoxAdapter(child: _IncomeSection()),
          const SliverSizedBox(height: 100),
          const SliverToBoxAdapter(child: _CardsSection()),
          const SliverSizedBox(height: 100),
          const SliverToBoxAdapter(child: _PdfSection()),
          const SliverSizedBox(height: 180),
          const SliverToBoxAdapter(child: _TableSection()),
          const SliverSizedBox(height: 100),
          const SliverToBoxAdapter(child: _BecomePartnerSection()),
          const SliverToBoxAdapter(child: Footer()),
        ],
      ),
    );
  }
}
