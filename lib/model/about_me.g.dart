// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_me.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AboutMe _$AboutMeFromJson(Map<String, dynamic> json) => _AboutMe(
  id: json['id'] as String,
  content: json['content'] as String,
  language: json['language'] as String,
);

// ignore: unused_element
abstract class _$AboutMePerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? content(String instance) => instance;
  // ignore: unused_element
  static Object? language(String instance) => instance;
}

Map<String, dynamic> _$AboutMeToJson(_AboutMe instance) => <String, dynamic>{
  'id': instance.id,
  'content': instance.content,
  'language': instance.language,
};
