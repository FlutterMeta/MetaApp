import 'package:flutter/material.dart';
import '../../../data/models/user.dart';
import '../../widgets/profile_header/profile_header.dart';

class UserRefferalsPage extends StatelessWidget {
  final User user;

  const UserRefferalsPage({
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileHeader.adminSearch(),
      body: Text(user.email),
    );
  }
}
