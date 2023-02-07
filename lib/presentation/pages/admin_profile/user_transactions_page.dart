import 'package:flutter/material.dart';
import '../../widgets/profile_header/profile_header.dart';

class UserTransactionsPage extends StatelessWidget {
  const UserTransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileHeader.admin(),
    );
  }
}
