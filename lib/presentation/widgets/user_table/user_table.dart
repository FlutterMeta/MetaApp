import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:meta_app/core/mixins/message_overlay.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/navigation/app_router.gr.dart';
import 'package:meta_app/presentation/widgets/admin_window.dart';
import 'package:meta_app/presentation/widgets/colored_button.dart';
import 'package:meta_app/presentation/widgets/editing_field.dart';
import 'package:meta_app/presentation/widgets/responsive.dart';
import 'package:provider/provider.dart';

import '../../../data/models/result.dart';
import '../../../data/models/transaction.dart';
import '../../../data/models/user.dart';
import '../../providers/users_notifier.dart';

part 'components/user_information_panel.dart';
part 'components/avatar_cell.dart';
part 'components/manage_user_panel.dart';
part 'components/table_cell.dart';
part 'components/show_text_button.dart';
part 'components/user_general_info_panel.dart';

class UserTable extends StatelessWidget {
  final List<User> users;

  const UserTable({
    required this.users,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1270),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _UserInformationPanel(user: users[index]),
                const Divider(),
                _ManageUserPanel(user: users[index]),
              ],
            );
          },
          separatorBuilder: (_, __) => const Divider(),
          itemCount: users.length,
        ),
      ),
    );
  }
}
