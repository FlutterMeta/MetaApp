import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import '../../widgets/profile_header/profile_header.dart';
import '../../widgets/rights_reserved_footer.dart';
import '../../widgets/user_table.dart';

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
      body: Portal(
        child: SingleChildScrollView(
          child: Align(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1270),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  const _HeaderText(),
                  const SizedBox(height: 60),
                  UserSummaryInfo(user: user),
                  UserTable(users: user.referrals),
                  const SizedBox(height: 100),
                  const RightsReservedFooter(),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HeaderText extends StatelessWidget {
  const _HeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1270),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          context.localizations.userReferrals,
          style: context.text.partnerTableSectionTitle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
