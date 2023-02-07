import 'package:flutter/material.dart';
import '../../widgets/profile_header/profile_header.dart';

class UserRefferalsPage extends StatelessWidget {
  const UserRefferalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileHeader.adminSearch(),
    );
  }
}
