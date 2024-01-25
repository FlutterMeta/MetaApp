// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referrals.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Referrals _$ReferralsFromJson(Map<String, dynamic> json) => Referrals(
      userList: (json['userList'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReferralsToJson(Referrals instance) => <String, dynamic>{
      'userList': instance.userList,
    };
