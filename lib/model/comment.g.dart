// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Comment _$CommentFromJson(Map<String, dynamic> json) => _Comment(
  id: json['id'] as String,
  content: json['content'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  authorName: json['authorName'] as String,
  authorEmail: json['authorEmail'] as String,
);

const _$CommentFieldMap = <String, String>{
  'id': 'id',
  'content': 'content',
  'createdAt': 'createdAt',
  'authorName': 'authorName',
  'authorEmail': 'authorEmail',
};

// ignore: unused_element
abstract class _$CommentPerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? content(String instance) => instance;
  // ignore: unused_element
  static Object? createdAt(DateTime instance) => instance.toIso8601String();
  // ignore: unused_element
  static Object? authorName(String instance) => instance;
  // ignore: unused_element
  static Object? authorEmail(String instance) => instance;
}

Map<String, dynamic> _$CommentToJson(_Comment instance) => <String, dynamic>{
  'id': instance.id,
  'content': instance.content,
  'createdAt': instance.createdAt.toIso8601String(),
  'authorName': instance.authorName,
  'authorEmail': instance.authorEmail,
};
