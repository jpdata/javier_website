import 'package:javier_website/model/comment.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'entry.freezed.dart';
part 'entry.g.dart';

@freezed
sealed class Entry with _$Entry {
  const factory Entry({
    required String id,
    required String title,
    required String subtitle,
    required String content,
    required DateTime createdAt,
    required String bannerImageUrl,
    @Default(<String>[]) List<String> tags,
    @Default(<Comment>[]) List<Comment> comments,
  }) = _Entry;

  factory Entry.fromJson(Map<String, Object?> json) => _$EntryFromJson(json);
}
