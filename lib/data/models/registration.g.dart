// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Registration _$RegistrationFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['login', 'phoneNumber', 'email', 'password'],
    disallowNullValues: const ['login', 'phoneNumber', 'email', 'password'],
  );
  return Registration(
    login: json['login'] as String,
    phoneNumber: json['phoneNumber'] as String,
    email: json['email'] as String,
    password: json['password'] as String,
    referal: json['referal'] as String?,
  );
}

Map<String, dynamic> _$RegistrationToJson(Registration instance) =>
    <String, dynamic>{
      'login': instance.login,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'password': instance.password,
      'referal': instance.referal,
    };
