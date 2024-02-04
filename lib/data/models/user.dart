import 'package:json_annotation/json_annotation.dart';
import 'package:meta_app/data/models/product.dart';
import 'package:meta_app/data/models/role_list.dart';
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
  double balance;
  @JsonEnum()
  @JsonKey(name: 'roles')
  final UserRole? role;
  List<Transaction>? transactions;
  List<Product>? products;

  User({
    required this.id,
    required this.key,
    required this.login,
    required this.email,
    required this.level,
    required this.phoneNumber,
    required this.balance,
    this.role = UserRole.user,
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

  factory User.fromJson(Map<String, dynamic> json) {
    final rolesList = RoleList.fromJson(json['roles'] as Map<String, dynamic>);

    if (rolesList.values.isNotEmpty) {
      json['roles'] = rolesList.values
          .first; // Use the first role (there must be only one role for each user)
    } else {
      json['roles'] = 'User'; // Default role
    }
    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    String? id,
    String? key,
    String? login,
    String? email,
    int? level,
    String? phoneNumber,
    double? balance,
    UserRole? role,
    List<Transaction>? transactions,
    List<Product>? products,
  }) {
    return User(
      id: id ?? this.id,
      key: key ?? this.key,
      login: login ?? this.login,
      email: email ?? this.email,
      level: level ?? this.level,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      balance: balance ?? this.balance,
      role: role ?? this.role,
      transactions: transactions ?? this.transactions,
      products: products ?? this.products,
    );
  }
}

enum UserRole {
  @JsonValue('User')
  user,
  @JsonValue('Admin')
  admin,
  @JsonValue('Adam')
  adam,
}
