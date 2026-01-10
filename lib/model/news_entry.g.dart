// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NewsEntry _$NewsEntryFromJson(Map<String, dynamic> json) => _NewsEntry(
  id: json['id'] as String,
  content: json['content'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  comments:
      (json['comments'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Comment>[],
);
// ignore: unused_element
abstract class _$NewsEntryPerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? content(String instance) => instance;
  // ignore: unused_element
  static Object? createdAt(DateTime instance) => instance.toIso8601String();
  // ignore: unused_element
  static Object? tags(List<String> instance) => instance;
  // ignore: unused_element
  static Object? comments(List<Comment> instance) => instance;
}

Map<String, dynamic> _$NewsEntryToJson(_NewsEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
      'tags': instance.tags,
      'comments': instance.comments,
    };
