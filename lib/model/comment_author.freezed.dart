// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_author.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommentAuthor _$CommentAuthorFromJson(Map<String, dynamic> json) {
  return _CommentAuthor.fromJson(json);
}

/// @nodoc
mixin _$CommentAuthor {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;

  /// Serializes this CommentAuthor to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommentAuthor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentAuthorCopyWith<CommentAuthor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentAuthorCopyWith<$Res> {
  factory $CommentAuthorCopyWith(
          CommentAuthor value, $Res Function(CommentAuthor) then) =
      _$CommentAuthorCopyWithImpl<$Res, CommentAuthor>;
  @useResult
  $Res call({String name, String email, String avatar});
}

/// @nodoc
class _$CommentAuthorCopyWithImpl<$Res, $Val extends CommentAuthor>
    implements $CommentAuthorCopyWith<$Res> {
  _$CommentAuthorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommentAuthor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? avatar = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentAuthorImplCopyWith<$Res>
    implements $CommentAuthorCopyWith<$Res> {
  factory _$$CommentAuthorImplCopyWith(
          _$CommentAuthorImpl value, $Res Function(_$CommentAuthorImpl) then) =
      __$$CommentAuthorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String email, String avatar});
}

/// @nodoc
class __$$CommentAuthorImplCopyWithImpl<$Res>
    extends _$CommentAuthorCopyWithImpl<$Res, _$CommentAuthorImpl>
    implements _$$CommentAuthorImplCopyWith<$Res> {
  __$$CommentAuthorImplCopyWithImpl(
      _$CommentAuthorImpl _value, $Res Function(_$CommentAuthorImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentAuthor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? avatar = null,
  }) {
    return _then(_$CommentAuthorImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentAuthorImpl implements _CommentAuthor {
  const _$CommentAuthorImpl(
      {required this.name, required this.email, required this.avatar});

  factory _$CommentAuthorImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentAuthorImplFromJson(json);

  @override
  final String name;
  @override
  final String email;
  @override
  final String avatar;

  @override
  String toString() {
    return 'CommentAuthor(name: $name, email: $email, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentAuthorImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, email, avatar);

  /// Create a copy of CommentAuthor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentAuthorImplCopyWith<_$CommentAuthorImpl> get copyWith =>
      __$$CommentAuthorImplCopyWithImpl<_$CommentAuthorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentAuthorImplToJson(
      this,
    );
  }
}

abstract class _CommentAuthor implements CommentAuthor {
  const factory _CommentAuthor(
      {required final String name,
      required final String email,
      required final String avatar}) = _$CommentAuthorImpl;

  factory _CommentAuthor.fromJson(Map<String, dynamic> json) =
      _$CommentAuthorImpl.fromJson;

  @override
  String get name;
  @override
  String get email;
  @override
  String get avatar;

  /// Create a copy of CommentAuthor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentAuthorImplCopyWith<_$CommentAuthorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
