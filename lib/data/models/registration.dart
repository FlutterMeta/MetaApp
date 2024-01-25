import 'package:json_annotation/json_annotation.dart';

part 'registration.g.dart';

@JsonSerializable()
class Registration {
  @JsonKey(required: true, disallowNullValue: true)
  final String login;

  @JsonKey(required: true, disallowNullValue: true)
  final String phoneNumber;

  @JsonKey(required: true, disallowNullValue: true)
  final String email;

  @JsonKey(required: true, disallowNullValue: true)
  final String password;

  final String? referal;

  Registration({
    required this.login,
    required this.phoneNumber,
    required this.email,
    required this.password,
    this.referal,
  });

  // JSON serialization
  factory Registration.fromJson(Map<String, dynamic> json) =>
      _$RegistrationFromJson(json);
  Map<String, dynamic> toJson() => _$RegistrationToJson(this);
}
