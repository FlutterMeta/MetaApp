import 'package:meta_app/data/models/user.dart';

class Referrals {
  final List<User> userList;

  const Referrals({required this.userList});

  Referrals.empty() : userList = [];
}
