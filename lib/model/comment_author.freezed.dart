// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_author.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommentAuthor {
  String get name;
  String get email;
  String get avatar;

  /// Create a copy of CommentAuthor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommentAuthorCopyWith<CommentAuthor> get copyWith =>
      _$CommentAuthorCopyWithImpl<CommentAuthor>(
          this as CommentAuthor, _$identity);

  /// Serializes this CommentAuthor to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommentAuthor &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, email, avatar);

  @override
  String toString() {
    return 'CommentAuthor(name: $name, email: $email, avatar: $avatar)';
  }
}

/// @nodoc
abstract mixin class $CommentAuthorCopyWith<$Res> {
  factory $CommentAuthorCopyWith(
          CommentAuthor value, $Res Function(CommentAuthor) _then) =
      _$CommentAuthorCopyWithImpl;
  @useResult
  $Res call({String name, String email, String avatar});
}

/// @nodoc
class _$CommentAuthorCopyWithImpl<$Res>
    implements $CommentAuthorCopyWith<$Res> {
  _$CommentAuthorCopyWithImpl(this._self, this._then);

  final CommentAuthor _self;
  final $Res Function(CommentAuthor) _then;

  /// Create a copy of CommentAuthor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? avatar = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _self.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CommentAuthor implements CommentAuthor {
  const _CommentAuthor(
      {required this.name, required this.email, required this.avatar});
  factory _CommentAuthor.fromJson(Map<String, dynamic> json) =>
      _$CommentAuthorFromJson(json);

  @override
  final String name;
  @override
  final String email;
  @override
  final String avatar;

  /// Create a copy of CommentAuthor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CommentAuthorCopyWith<_CommentAuthor> get copyWith =>
      __$CommentAuthorCopyWithImpl<_CommentAuthor>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CommentAuthorToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CommentAuthor &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, email, avatar);

  @override
  String toString() {
    return 'CommentAuthor(name: $name, email: $email, avatar: $avatar)';
  }
}

/// @nodoc
abstract mixin class _$CommentAuthorCopyWith<$Res>
    implements $CommentAuthorCopyWith<$Res> {
  factory _$CommentAuthorCopyWith(
          _CommentAuthor value, $Res Function(_CommentAuthor) _then) =
      __$CommentAuthorCopyWithImpl;
  @override
  @useResult
  $Res call({String name, String email, String avatar});
}

/// @nodoc
class __$CommentAuthorCopyWithImpl<$Res>
    implements _$CommentAuthorCopyWith<$Res> {
  __$CommentAuthorCopyWithImpl(this._self, this._then);

  final _CommentAuthor _self;
  final $Res Function(_CommentAuthor) _then;

  /// Create a copy of CommentAuthor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? avatar = null,
  }) {
    return _then(_CommentAuthor(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _self.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
