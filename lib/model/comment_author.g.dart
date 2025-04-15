// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CommentAuthor _$CommentAuthorFromJson(Map<String, dynamic> json) =>
    _CommentAuthor(
      name: json['name'] as String,
      email: json['email'] as String,
      avatar: json['avatar'] as String,
    );

const _$CommentAuthorFieldMap = <String, String>{
  'name': 'name',
  'email': 'email',
  'avatar': 'avatar',
};

// ignore: unused_element
abstract class _$CommentAuthorPerFieldToJson {
  // ignore: unused_element
  static Object? name(String instance) => instance;
  // ignore: unused_element
  static Object? email(String instance) => instance;
  // ignore: unused_element
  static Object? avatar(String instance) => instance;
}

Map<String, dynamic> _$CommentAuthorToJson(_CommentAuthor instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'avatar': instance.avatar,
    };
