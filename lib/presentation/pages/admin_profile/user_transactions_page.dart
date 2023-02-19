import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../data/models/user.dart';
import '../../widgets/profile_header/profile_header.dart';

class UserTransactionsPage extends StatelessWidget {
  final User user;
  final String userName;

  const UserTransactionsPage({
    required this.user,
    @PathParam('userName') required this.userName,
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
