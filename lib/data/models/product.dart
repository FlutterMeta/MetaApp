import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/subscription_tier.dart';
import 'user.dart'; // Make sure to import the User class

part 'product.g.dart';

@JsonSerializable(explicitToJson: true)
class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final int subscriptionDuration;
  final SubscriptionTier subscriptionTier;
  final List<User> users;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.subscriptionDuration,
    required this.subscriptionTier,
    required this.users,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
