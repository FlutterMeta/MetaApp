import 'package:json_annotation/json_annotation.dart';

enum SubscriptionTier {
  @JsonValue(1)
  basic(1),
  @JsonValue(2)
  advanced(2),
  @JsonValue(3)
  professional(3),
  //Additional subscription tiers
  @JsonValue(4)
  professionalPlus(4),
  @JsonValue(5)
  godlike(5),
  @JsonValue(6)
  godlikePlus(6);

  const SubscriptionTier(this.value);

  final int value;
}
