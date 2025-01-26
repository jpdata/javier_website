// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entry_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EntryDto _$EntryDtoFromJson(Map<String, dynamic> json) {
  return _EntryDto.fromJson(json);
}

/// @nodoc
mixin _$EntryDto {
  String get title => throw _privateConstructorUsedError;
  String get subtitle => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  @JsonSerializable(converters: [CommentDtoReferenceConverter()])
  List<CommentDtoDocumentReference> get comments =>
      throw _privateConstructorUsedError;

  /// Serializes this EntryDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EntryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EntryDtoCopyWith<EntryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntryDtoCopyWith<$Res> {
  factory $EntryDtoCopyWith(EntryDto value, $Res Function(EntryDto) then) =
      _$EntryDtoCopyWithImpl<$Res, EntryDto>;
  @useResult
  $Res call(
      {String title,
      String subtitle,
      String content,
      DateTime createdAt,
      List<String> tags,
      @JsonSerializable(converters: [CommentDtoReferenceConverter()])
      List<CommentDtoDocumentReference> comments});
}

/// @nodoc
class _$EntryDtoCopyWithImpl<$Res, $Val extends EntryDto>
    implements $EntryDtoCopyWith<$Res> {
  _$EntryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EntryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subtitle = null,
    Object? content = null,
    Object? createdAt = null,
    Object? tags = null,
    Object? comments = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentDtoDocumentReference>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EntryDtoImplCopyWith<$Res>
    implements $EntryDtoCopyWith<$Res> {
  factory _$$EntryDtoImplCopyWith(
          _$EntryDtoImpl value, $Res Function(_$EntryDtoImpl) then) =
      __$$EntryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String subtitle,
      String content,
      DateTime createdAt,
      List<String> tags,
      @JsonSerializable(converters: [CommentDtoReferenceConverter()])
      List<CommentDtoDocumentReference> comments});
}

/// @nodoc
class __$$EntryDtoImplCopyWithImpl<$Res>
    extends _$EntryDtoCopyWithImpl<$Res, _$EntryDtoImpl>
    implements _$$EntryDtoImplCopyWith<$Res> {
  __$$EntryDtoImplCopyWithImpl(
      _$EntryDtoImpl _value, $Res Function(_$EntryDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of EntryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subtitle = null,
    Object? content = null,
    Object? createdAt = null,
    Object? tags = null,
    Object? comments = null,
  }) {
    return _then(_$EntryDtoImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      comments: null == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentDtoDocumentReference>,
    ));
  }
}

/// @nodoc

@firestoreSerializable
class _$EntryDtoImpl with DiagnosticableTreeMixin implements _EntryDto {
  const _$EntryDtoImpl(
      {required this.title,
      required this.subtitle,
      required this.content,
      required this.createdAt,
      required final List<String> tags,
      @JsonSerializable(converters: [CommentDtoReferenceConverter()])
      required final List<CommentDtoDocumentReference> comments})
      : _tags = tags,
        _comments = comments;

  factory _$EntryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$EntryDtoImplFromJson(json);

  @override
  final String title;
  @override
  final String subtitle;
  @override
  final String content;
  @override
  final DateTime createdAt;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<CommentDtoDocumentReference> _comments;
  @override
  @JsonSerializable(converters: [CommentDtoReferenceConverter()])
  List<CommentDtoDocumentReference> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EntryDto(title: $title, subtitle: $subtitle, content: $content, createdAt: $createdAt, tags: $tags, comments: $comments)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EntryDto'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('subtitle', subtitle))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('tags', tags))
      ..add(DiagnosticsProperty('comments', comments));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EntryDtoImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other._comments, _comments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      subtitle,
      content,
      createdAt,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_comments));

  /// Create a copy of EntryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EntryDtoImplCopyWith<_$EntryDtoImpl> get copyWith =>
      __$$EntryDtoImplCopyWithImpl<_$EntryDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EntryDtoImplToJson(
      this,
    );
  }
}

abstract class _EntryDto implements EntryDto {
  const factory _EntryDto(
          {required final String title,
          required final String subtitle,
          required final String content,
          required final DateTime createdAt,
          required final List<String> tags,
          @JsonSerializable(converters: [CommentDtoReferenceConverter()])
          required final List<CommentDtoDocumentReference> comments}) =
      _$EntryDtoImpl;

  factory _EntryDto.fromJson(Map<String, dynamic> json) =
      _$EntryDtoImpl.fromJson;

  @override
  String get title;
  @override
  String get subtitle;
  @override
  String get content;
  @override
  DateTime get createdAt;
  @override
  List<String> get tags;
  @override
  @JsonSerializable(converters: [CommentDtoReferenceConverter()])
  List<CommentDtoDocumentReference> get comments;

  /// Create a copy of EntryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EntryDtoImplCopyWith<_$EntryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
