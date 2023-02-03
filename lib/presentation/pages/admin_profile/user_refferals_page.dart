import 'package:flutter/material.dart';
import 'package:meta_app/presentation/widgets/profile_header/header.dart';

class UserRefferalsPage extends StatelessWidget {
  const UserRefferalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileHeader.adminSearch(),
    );
  }
}
