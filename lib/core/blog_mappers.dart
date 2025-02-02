import 'package:javier_website/data/firestore_client.dart';
import 'package:javier_website/model/comment.dart';
import 'package:javier_website/model/entry.dart';

extension CommentMapper on CommentDto {
  Comment toEntity() {
    return Comment(
      content: content,
      createdAt: createdAt,
      authorName: authorName,
      authorEmail: authorEmail,
    );
  }
}

extension EntryMapper on EntryDto {
  Future<Entry> toEntity() async {
    var commms = await Future.wait(comments.map((e) async {
      var value = await e.get();
      return value.data?.toEntity();
    }).toList());
    return Entry(
      title: title,
      subtitle: subtitle,
      content: content,
      createdAt: createdAt,
      tags: tags ?? [],
      comments: commms.whereType<Comment>().toList(),
      bannerImageUrl: bannerImageUrl,
    );
  }
}

//map from Entry to EntryDto
extension EntryDtoMapper on Entry {
  EntryDto toDto() {
    return EntryDto(
      title: title,
      subtitle: subtitle,
      content: content,
      createdAt: createdAt,
      tags: tags,
      comments: [],// comments.map((e) => e.toDto()).toList(),
      bannerImageUrl: bannerImageUrl,
    );
  }
}

extension CommentDtoMapper on Comment {
  CommentDto toDto() {
    return CommentDto(
      content: content,
      createdAt: createdAt,
      authorName: authorName,
      authorEmail: authorEmail,
    );
  }
}