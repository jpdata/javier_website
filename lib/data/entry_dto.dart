import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:javier_website/data/comment_dto.dart';
import 'package:javier_website/data/common.dart';
import 'package:javier_website/data/converters.dart';

part 'entry_dto.g.dart';
part 'entry_dto.freezed.dart';

@Collection<EntryDto>('entries')
@freezed
class EntryDto with _$EntryDto {
  @firestoreSerializable
  const factory EntryDto({
    required String title,
    required String subtitle,
    required String content,
    required DateTime createdAt,
    required List<String> tags,
    @JsonSerializable(converters: [CommentDtoReferenceConverter()])
    required List<CommentDtoDocumentReference> comments,
  }) = _EntryDto;

  factory EntryDto.fromJson(Map<String, Object?> json) =>
      _$EntryDtoFromJson(json);
}
