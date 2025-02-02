// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentAuthorImpl _$$CommentAuthorImplFromJson(Map<String, dynamic> json) =>
    _$CommentAuthorImpl(
      name: json['name'] as String,
      email: json['email'] as String,
      avatar: json['avatar'] as String,
    );

const _$$CommentAuthorImplFieldMap = <String, String>{
  'name': 'name',
  'email': 'email',
  'avatar': 'avatar',
};

// ignore: unused_element
abstract class _$$CommentAuthorImplPerFieldToJson {
  // ignore: unused_element
  static Object? name(String instance) => instance;
  // ignore: unused_element
  static Object? email(String instance) => instance;
  // ignore: unused_element
  static Object? avatar(String instance) => instance;
}

Map<String, dynamic> _$$CommentAuthorImplToJson(_$CommentAuthorImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'avatar': instance.avatar,
    };
