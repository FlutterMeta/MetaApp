import 'package:flutter/material.dart';
import 'package:meta_app/presentation/widgets/header.dart';

class UserTransactionsPage extends StatelessWidget {
  const UserTransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileHeader.admin(),
    );
  }
}
