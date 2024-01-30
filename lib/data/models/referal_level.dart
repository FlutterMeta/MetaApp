import 'package:json_annotation/json_annotation.dart';

part 'referal_level.g.dart';

@JsonSerializable()
class ReferalLevel {
  final int id;
  final int level;
  final double reward;
  final int requiredReferalsCount;

  ReferalLevel({
    required this.id,
    required this.level,
    required this.reward,
    required this.requiredReferalsCount,
  });

  factory ReferalLevel.fromJson(Map<String, dynamic> json) =>
      _$ReferalLevelFromJson(json);

  Map<String, dynamic> toJson() => _$ReferalLevelToJson(this);
}
