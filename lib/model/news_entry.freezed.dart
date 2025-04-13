// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewsEntry implements DiagnosticableTreeMixin {
  String get id;
  String get content;
  DateTime get createdAt;
  List<String> get tags;
  List<Comment> get comments;

  /// Create a copy of NewsEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NewsEntryCopyWith<NewsEntry> get copyWith =>
      _$NewsEntryCopyWithImpl<NewsEntry>(this as NewsEntry, _$identity);

  /// Serializes this NewsEntry to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'NewsEntry'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('tags', tags))
      ..add(DiagnosticsProperty('comments', comments));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NewsEntry &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            const DeepCollectionEquality().equals(other.comments, comments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      content,
      createdAt,
      const DeepCollectionEquality().hash(tags),
      const DeepCollectionEquality().hash(comments));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NewsEntry(id: $id, content: $content, createdAt: $createdAt, tags: $tags, comments: $comments)';
  }
}

/// @nodoc
abstract mixin class $NewsEntryCopyWith<$Res> {
  factory $NewsEntryCopyWith(NewsEntry value, $Res Function(NewsEntry) _then) =
      _$NewsEntryCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String content,
      DateTime createdAt,
      List<String> tags,
      List<Comment> comments});
}

/// @nodoc
class _$NewsEntryCopyWithImpl<$Res> implements $NewsEntryCopyWith<$Res> {
  _$NewsEntryCopyWithImpl(this._self, this._then);

  final NewsEntry _self;
  final $Res Function(NewsEntry) _then;

  /// Create a copy of NewsEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? createdAt = null,
    Object? tags = null,
    Object? comments = null,
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
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: null == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      comments: null == comments
          ? _self.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _NewsEntry with DiagnosticableTreeMixin implements NewsEntry {
  const _NewsEntry(
      {required this.id,
      required this.content,
      required this.createdAt,
      final List<String> tags = const <String>[],
      final List<Comment> comments = const <Comment>[]})
      : _tags = tags,
        _comments = comments;
  factory _NewsEntry.fromJson(Map<String, dynamic> json) =>
      _$NewsEntryFromJson(json);

  @override
  final String id;
  @override
  final String content;
  @override
  final DateTime createdAt;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<Comment> _comments;
  @override
  @JsonKey()
  List<Comment> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  /// Create a copy of NewsEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NewsEntryCopyWith<_NewsEntry> get copyWith =>
      __$NewsEntryCopyWithImpl<_NewsEntry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NewsEntryToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'NewsEntry'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('tags', tags))
      ..add(DiagnosticsProperty('comments', comments));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NewsEntry &&
            (identical(other.id, id) || other.id == id) &&
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
      id,
      content,
      createdAt,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_comments));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NewsEntry(id: $id, content: $content, createdAt: $createdAt, tags: $tags, comments: $comments)';
  }
}

/// @nodoc
abstract mixin class _$NewsEntryCopyWith<$Res>
    implements $NewsEntryCopyWith<$Res> {
  factory _$NewsEntryCopyWith(
          _NewsEntry value, $Res Function(_NewsEntry) _then) =
      __$NewsEntryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String content,
      DateTime createdAt,
      List<String> tags,
      List<Comment> comments});
}

/// @nodoc
class __$NewsEntryCopyWithImpl<$Res> implements _$NewsEntryCopyWith<$Res> {
  __$NewsEntryCopyWithImpl(this._self, this._then);

  final _NewsEntry _self;
  final $Res Function(_NewsEntry) _then;

  /// Create a copy of NewsEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? createdAt = null,
    Object? tags = null,
    Object? comments = null,
  }) {
    return _then(_NewsEntry(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: null == tags
          ? _self._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      comments: null == comments
          ? _self._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>,
    ));
  }
}

// dart format on
