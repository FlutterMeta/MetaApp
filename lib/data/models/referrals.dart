import 'package:json_annotation/json_annotation.dart';
import 'package:meta_app/data/models/user.dart';

part 'referrals.g.dart';

@JsonSerializable()
class Referrals {
  final List<User> userList;

  const Referrals({required this.userList});

  Referrals.empty() : userList = [];

  factory Referrals.fromJson(Map<String, dynamic> json) =>
      _$ReferralsFromJson(json);

  Map<String, dynamic> toJson() => _$ReferralsToJson(this);
}
