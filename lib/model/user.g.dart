// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
      id: json['id'] as String,
      name: json['name'] as String,
      lastname: json['lastname'] as String,
      email: json['email'] as String,
      registryDate: json['registryDate'] as String,
      role: $enumDecode(_$RoleEnumMap, json['role']),
      status: $enumDecode(_$StatusEnumMap, json['status']),
    );

const _$UserFieldMap = <String, String>{
  'id': 'id',
  'name': 'name',
  'lastname': 'lastname',
  'email': 'email',
  'registryDate': 'registryDate',
  'role': 'role',
  'status': 'status',
};

// ignore: unused_element
abstract class _$UserPerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? name(String instance) => instance;
  // ignore: unused_element
  static Object? lastname(String instance) => instance;
  // ignore: unused_element
  static Object? email(String instance) => instance;
  // ignore: unused_element
  static Object? registryDate(String instance) => instance;
  // ignore: unused_element
  static Object? role(Role instance) => _$RoleEnumMap[instance]!;
  // ignore: unused_element
  static Object? status(Status instance) => _$StatusEnumMap[instance]!;
}

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lastname': instance.lastname,
      'email': instance.email,
      'registryDate': instance.registryDate,
      'role': _$RoleEnumMap[instance.role]!,
      'status': _$StatusEnumMap[instance.status]!,
    };

const _$RoleEnumMap = {
  Role.user: 'user',
  Role.admin: 'admin',
  Role.guest: 'guest',
  Role.system: 'system',
};

const _$StatusEnumMap = {
  Status.active: 'active',
  Status.inactive: 'inactive',
  Status.suspended: 'suspended',
  Status.deleted: 'deleted',
};
