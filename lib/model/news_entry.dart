import 'package:javier_website/model/comment.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'news_entry.freezed.dart';
part 'news_entry.g.dart';

@freezed
sealed class NewsEntry with _$NewsEntry {
  const factory NewsEntry({
    required String id,
    required String content,
    required DateTime createdAt,
    @Default(<String>[]) List<String> tags,
    @Default(<Comment>[]) List<Comment> comments,
  }) = _NewsEntry;

  factory NewsEntry.fromJson(Map<String, Object?> json) => _$NewsEntryFromJson(json);
}
