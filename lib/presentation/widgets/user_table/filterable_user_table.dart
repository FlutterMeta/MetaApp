import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/widgets/user_table/user_table.dart';

import '../../../data/models/user.dart';
import '../profile_header/search_bar_controller.dart';

class FilterableUserTable extends StatefulWidget {
  final List<User> users;

  const FilterableUserTable({
    required this.users,
    Key? key,
  }) : super(key: key);

  @override
  State<FilterableUserTable> createState() => FilterableUserTableState();
}

class FilterableUserTableState extends State<FilterableUserTable> {
  late List<User> users;

  void _filter() {
    final searchBarValue = SearchBarController.searchInput.value;
    setState(
      () => users = widget.users
          .where((user) =>
              user.name.toLowerCase().contains(searchBarValue.toLowerCase()))
          .toList(),
    );
  }

  @override
  void initState() {
    super.initState();
    users = widget.users;
    SearchBarController.searchInput.addListener(_filter);
  }

  @override
  void dispose() {
    SearchBarController.searchInput.removeListener(_filter);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (users.isEmpty) {
      return const NoUserWidget();
    }
    return UserTable(users: users);
  }
}

class NoUserWidget extends StatelessWidget {
  const NoUserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ValueListenableBuilder(
        valueListenable: SearchBarController.searchInput,
        builder: (context, searchInput, child) {
          return Text.rich(
            TextSpan(
              text: context.localizations.noUserWithName,
              style: context.text.profilePageBody.copyWith(fontSize: 16),
              children: [
                const TextSpan(text: ' '),
                TextSpan(
                  text: searchInput,
                  style: context.text.profilePageBody
                      .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: ' '),
                TextSpan(
                  text: context.localizations.found.toLowerCase(),
                  style: context.text.profilePageBody.copyWith(fontSize: 16),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
