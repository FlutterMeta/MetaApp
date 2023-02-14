import 'package:flutter/material.dart';
import '../../../data/models/user.dart';
import '../../widgets/profile_header/profile_header.dart';

class UserTransactionsPage extends StatelessWidget {
  final User user;

  const UserTransactionsPage({
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileHeader.admin(),
      body: Text(user.name),
    );
  }
}
