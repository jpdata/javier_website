// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      content: json['content'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      authorName: json['authorName'] as String,
      authorEmail: json['authorEmail'] as String,
    );

const _$$CommentImplFieldMap = <String, String>{
  'content': 'content',
  'createdAt': 'createdAt',
  'authorName': 'authorName',
  'authorEmail': 'authorEmail',
};

// ignore: unused_element
abstract class _$$CommentImplPerFieldToJson {
  // ignore: unused_element
  static Object? content(String instance) => instance;
  // ignore: unused_element
  static Object? createdAt(DateTime instance) => instance.toIso8601String();
  // ignore: unused_element
  static Object? authorName(String instance) => instance;
  // ignore: unused_element
  static Object? authorEmail(String instance) => instance;
}

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
      'authorName': instance.authorName,
      'authorEmail': instance.authorEmail,
    };
