import 'dart:math';

import 'package:flutter/material.dart';
import 'package:meta_app/presentation/widgets/gradient_button.dart';
import 'package:meta_app/presentation/widgets/header/header.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/widgets/gradient_text.dart';
import 'package:meta_app/presentation/widgets/hover.dart';
import 'package:meta_app/presentation/widgets/web_button.dart';

part 'sections/presentation_section.dart';
part 'sections/revelant_info_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 5,
              horizontal: max((context.screenWidth - 1270) / 2, 0) > 5
                  ? max((context.screenWidth - 1270) / 2, 0)
                  : 5,
            ),
            sliver: SliverPersistentHeader(delegate: Header(), pinned: true),
          ),
          if (context.screenWidth > 780)
            const SliverToBoxAdapter(
              child: SizedBox(height: 70),
            ),
          const SliverToBoxAdapter(
            child: SizedBox(
              width: double.infinity,
              child: Align(
                alignment: Alignment.center,
                child: _PresentationSection(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(height: 1700, color: Colors.deepPurple),
          ),
        ],
      ),
    );
  }
}
