// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Blog _$BlogFromJson(Map<String, dynamic> json) => Blog(
      id: json['id'] as int,
      title: json['title'] as String?,
      content: json['content'] as String?,
      createDate: DateTime.parse(json['createDate'] as String),
      url: json['url'] as String?,
      image: json['image'] as String,
    );

Map<String, dynamic> _$BlogToJson(Blog instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'url': instance.url,
      'image': instance.image,
      'createDate': instance.createDate.toIso8601String(),
    };
