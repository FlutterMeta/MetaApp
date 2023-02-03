import 'package:flutter/material.dart';
import 'package:meta_app/presentation/widgets/header.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileHeader.adminSearch(),
    );
  }
}
