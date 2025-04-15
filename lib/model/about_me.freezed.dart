// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'about_me.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AboutMe {
  String get id;
  String get content;
  String get language;

  /// Create a copy of AboutMe
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AboutMeCopyWith<AboutMe> get copyWith =>
      _$AboutMeCopyWithImpl<AboutMe>(this as AboutMe, _$identity);

  /// Serializes this AboutMe to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AboutMe &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, content, language);

  @override
  String toString() {
    return 'AboutMe(id: $id, content: $content, language: $language)';
  }
}

/// @nodoc
abstract mixin class $AboutMeCopyWith<$Res> {
  factory $AboutMeCopyWith(AboutMe value, $Res Function(AboutMe) _then) =
      _$AboutMeCopyWithImpl;
  @useResult
  $Res call({String id, String content, String language});
}

/// @nodoc
class _$AboutMeCopyWithImpl<$Res> implements $AboutMeCopyWith<$Res> {
  _$AboutMeCopyWithImpl(this._self, this._then);

  final AboutMe _self;
  final $Res Function(AboutMe) _then;

  /// Create a copy of AboutMe
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? language = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AboutMe implements AboutMe {
  const _AboutMe(
      {required this.id, required this.content, required this.language});
  factory _AboutMe.fromJson(Map<String, dynamic> json) =>
      _$AboutMeFromJson(json);

  @override
  final String id;
  @override
  final String content;
  @override
  final String language;

  /// Create a copy of AboutMe
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AboutMeCopyWith<_AboutMe> get copyWith =>
      __$AboutMeCopyWithImpl<_AboutMe>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AboutMeToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AboutMe &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, content, language);

  @override
  String toString() {
    return 'AboutMe(id: $id, content: $content, language: $language)';
  }
}

/// @nodoc
abstract mixin class _$AboutMeCopyWith<$Res> implements $AboutMeCopyWith<$Res> {
  factory _$AboutMeCopyWith(_AboutMe value, $Res Function(_AboutMe) _then) =
      __$AboutMeCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String content, String language});
}

/// @nodoc
class __$AboutMeCopyWithImpl<$Res> implements _$AboutMeCopyWith<$Res> {
  __$AboutMeCopyWithImpl(this._self, this._then);

  final _AboutMe _self;
  final $Res Function(_AboutMe) _then;

  /// Create a copy of AboutMe
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? language = null,
  }) {
    return _then(_AboutMe(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
