// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Entry _$EntryFromJson(Map<String, dynamic> json) => _Entry(
  id: json['id'] as String,
  title: json['title'] as String,
  subtitle: json['subtitle'] as String,
  content: json['content'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  bannerImageUrl: json['bannerImageUrl'] as String,
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  comments:
      (json['comments'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Comment>[],
);

const _$EntryFieldMap = <String, String>{
  'id': 'id',
  'title': 'title',
  'subtitle': 'subtitle',
  'content': 'content',
  'createdAt': 'createdAt',
  'bannerImageUrl': 'bannerImageUrl',
  'tags': 'tags',
  'comments': 'comments',
};

// ignore: unused_element
abstract class _$EntryPerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? title(String instance) => instance;
  // ignore: unused_element
  static Object? subtitle(String instance) => instance;
  // ignore: unused_element
  static Object? content(String instance) => instance;
  // ignore: unused_element
  static Object? createdAt(DateTime instance) => instance.toIso8601String();
  // ignore: unused_element
  static Object? bannerImageUrl(String instance) => instance;
  // ignore: unused_element
  static Object? tags(List<String> instance) => instance;
  // ignore: unused_element
  static Object? comments(List<Comment> instance) => instance;
}

Map<String, dynamic> _$EntryToJson(_Entry instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'subtitle': instance.subtitle,
  'content': instance.content,
  'createdAt': instance.createdAt.toIso8601String(),
  'bannerImageUrl': instance.bannerImageUrl,
  'tags': instance.tags,
  'comments': instance.comments,
};
