import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import '../../../data/models/user.dart';
import '../../widgets/profile_header/profile_header.dart';
import '../../widgets/rights_reserved_footer.dart';
import '../../widgets/user_table/user_table.dart';
import '../../widgets/user_table/filterable_user_table.dart';

class UserRefferalsPage extends StatelessWidget {
  final User user;
  final String userName;

  const UserRefferalsPage({
    required this.user,
    @PathParam('userName') required this.userName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileHeader.adminSearch(),
      body: SingleChildScrollView(
        child: Align(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1270),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                const _HeaderText(),
                const SizedBox(height: 60),
                UserGeneralInfoPanel(user: user),
                FilterableUserTable(users: user.referrals.userList),
                const SizedBox(height: 100),
                const RightsReservedFooter(),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HeaderText extends StatelessWidget {
  const _HeaderText({Key? key}) : super(key: key);

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
