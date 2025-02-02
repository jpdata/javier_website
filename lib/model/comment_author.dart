

import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_author.freezed.dart';
part 'comment_author.g.dart';

@freezed
class CommentAuthor with _$CommentAuthor {
  const factory CommentAuthor({
    required String name,
    required String email,
    required String avatar,
  }) = _CommentAuthor;

  factory CommentAuthor.fromJson(Map<String, Object?> json) => _$CommentAuthorFromJson(json);
}