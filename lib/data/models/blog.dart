import 'package:json_annotation/json_annotation.dart';

part 'blog.g.dart';

@JsonSerializable()
class Blog {
  final int id;
  final String? title;
  final String? content;
  final String? url;
  final String image;

  Blog({
    required this.id,
    required this.title,
    required this.content,
    this.url,
    required this.image,
  });
  factory Blog.fromJson(Map<String, dynamic> json) => _$BlogFromJson(json);
  Map<String, dynamic> toJson() => _$BlogToJson(this);
}
