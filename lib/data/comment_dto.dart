import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:javier_website/data/common.dart';

part 'comment_dto.g.dart';
part 'comment_dto.freezed.dart';

@Collection<CommentDto>('comments')
@freezed
class CommentDto with _$CommentDto {
  @firestoreSerializable
  const factory CommentDto({
    required String content,
    @FirestoreTimestampConverter() required DateTime createdAt,
    required String authorName,
    required String authorEmail,
  }) = _CommentDto;

  factory CommentDto.fromJson(Map<String, Object?> json) =>
      _$CommentDtoFromJson(json);
}
