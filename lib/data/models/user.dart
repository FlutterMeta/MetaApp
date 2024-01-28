import 'package:json_annotation/json_annotation.dart';
import 'package:meta_app/data/models/product.dart';
import 'package:meta_app/data/models/transaction.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String id;
  final String? key;
  final String login;
  final String email;
  final int level;
  final String phoneNumber;
  final double balance;
  @JsonEnum()
  @JsonKey(name: 'roles')
  final UserRole role;
  final List<Transaction>? transactions;
  final List<Product>? products;

  const User({
    required this.id,
    required this.key,
    required this.login,
    required this.email,
    required this.level,
    required this.phoneNumber,
    required this.balance,
    required this.role,
    required this.transactions,
    required this.products,
  });

  User.empty()
      : email = '',
        level = 0,
        key = '',
        balance = 0.0,
        id = '',
        login = '',
        phoneNumber = '',
        role = UserRole.user,
        transactions = const [],
        products = const [];

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

enum UserRole {
  @JsonValue('User')
  user,
  @JsonValue('Admin')
  admin,
  @JsonValue('Adam')
  adam,
}
