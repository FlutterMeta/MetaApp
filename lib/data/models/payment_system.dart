import 'dart:convert';
import 'dart:typed_data';
import 'package:json_annotation/json_annotation.dart';

part 'payment_system.g.dart';

@JsonSerializable(explicitToJson: true)
class PaymentSystem {
  final int id;
  final String title;
  @Uint8ListConverter()
  final Uint8List? image;
  final String key;
  bool enabled;

  PaymentSystem({
    required this.id,
    required this.title,
    this.image,
    this.enabled = true,
    required this.key,
  });

  factory PaymentSystem.fromJson(Map<String, dynamic> json) =>
      _$PaymentSystemFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentSystemToJson(this);
}

/// Converts to and from [Uint8List] and base64 [String].
class Uint8ListConverter implements JsonConverter<Uint8List?, String?> {
  /// Create a new instance of [Uint8ListConverter].
  const Uint8ListConverter();

  @override
  Uint8List? fromJson(String? json) {
    if (json == null) return null;
    return base64Decode(json);
  }

  @override
  String? toJson(Uint8List? object) {
    if (object == null) return null;
    return base64Encode(object);
  }
}
