import 'package:json_annotation/json_annotation.dart';

enum SubscriptionTier {
  @JsonValue(1)
  basic(1),
  @JsonValue(2)
  advanced(2),
  @JsonValue(3)
  professional(3);

  const SubscriptionTier(this.value);

  final int value;
}
