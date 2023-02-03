import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/pages/client_profile_page/sections/side_menu_section.dart';
import 'package:meta_app/presentation/widgets/header.dart';

class AdminProfilePage extends StatelessWidget {
  const AdminProfilePage({super.key});

  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileHeader.client(scaffoldKey: _scaffoldKey),
      drawer: const SideMenuSection(),
      backgroundColor: context.color.profilePageBackground,
      key: _scaffoldKey,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [Text("admin")],
      ),
    );
  }
}
