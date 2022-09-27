import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/widgets/mobile_header.dart';
import 'package:meta_app/presentation/widgets/web_header.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return context.screen.width > 1000
        ? const WebHeader()
        : const MobileHeader();
  }
}
