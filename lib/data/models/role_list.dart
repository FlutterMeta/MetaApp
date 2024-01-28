import 'package:json_annotation/json_annotation.dart';

part 'role_list.g.dart';

@JsonSerializable()
class RoleList {
  @JsonKey(name: '\$values')
  List<String> values;

  RoleList({required this.values});

  factory RoleList.fromJson(Map<String, dynamic> json) =>
      _$RoleListFromJson(json);

  Map<String, dynamic> toJson() => _$RoleListToJson(this);
}
