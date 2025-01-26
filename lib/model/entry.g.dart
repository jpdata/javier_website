// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EntryImpl _$$EntryImplFromJson(Map<String, dynamic> json) => _$EntryImpl(
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      content: json['content'] as String,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const <String>[],
      comments: (json['comments'] as List<dynamic>?)
              ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Comment>[],
    );

const _$$EntryImplFieldMap = <String, String>{
  'title': 'title',
  'subtitle': 'subtitle',
  'content': 'content',
  'tags': 'tags',
  'comments': 'comments',
};

// ignore: unused_element
abstract class _$$EntryImplPerFieldToJson {
  // ignore: unused_element
  static Object? title(String instance) => instance;
  // ignore: unused_element
  static Object? subtitle(String instance) => instance;
  // ignore: unused_element
  static Object? content(String instance) => instance;
  // ignore: unused_element
  static Object? tags(List<String> instance) => instance;
  // ignore: unused_element
  static Object? comments(List<Comment> instance) => instance;
}

Map<String, dynamic> _$$EntryImplToJson(_$EntryImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'content': instance.content,
      'tags': instance.tags,
      'comments': instance.comments,
    };
