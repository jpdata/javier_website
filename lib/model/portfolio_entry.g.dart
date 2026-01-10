// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PortfolioEntry _$PortfolioEntryFromJson(Map<String, dynamic> json) =>
    _PortfolioEntry(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      icon: json['icon'] as String? ?? '',
      iconIsAsset: json['iconIsAsset'] as bool? ?? false,
      imageUrl: json['imageUrl'] as String? ?? '',
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

// ignore: unused_element
abstract class _$PortfolioEntryPerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? name(String instance) => instance;
  // ignore: unused_element
  static Object? description(String instance) => instance;
  // ignore: unused_element
  static Object? url(String instance) => instance;
  // ignore: unused_element
  static Object? icon(String instance) => instance;
  // ignore: unused_element
  static Object? iconIsAsset(bool instance) => instance;
  // ignore: unused_element
  static Object? imageUrl(String instance) => instance;
  // ignore: unused_element
  static Object? createdAt(DateTime? instance) => instance?.toIso8601String();
}

Map<String, dynamic> _$PortfolioEntryToJson(_PortfolioEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'url': instance.url,
      'icon': instance.icon,
      'iconIsAsset': instance.iconIsAsset,
      'imageUrl': instance.imageUrl,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
