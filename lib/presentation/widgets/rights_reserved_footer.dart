import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';

class RightsReservedFooter extends StatelessWidget {
  const RightsReservedFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      context.localizations.allRightsReserved,
      style: context.text.allRightsReserved,
    );
  }
}
