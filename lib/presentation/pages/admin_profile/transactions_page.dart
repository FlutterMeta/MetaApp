import 'package:flutter/material.dart';
import 'package:meta_app/presentation/widgets/profile_header/header.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileHeader.adminSearch(),
    );
  }
}
