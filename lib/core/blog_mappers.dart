import 'package:javier_website/data/firestore_client.dart';
import 'package:javier_website/model/comment.dart';
import 'package:javier_website/model/entry.dart';
import 'package:javier_website/model/news_entry.dart';

extension CommentMapper on CommentDto {
  Comment toEntity() {
    return Comment(
      id: id,
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
      id: id,
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
      id: id,
      title: title,
      subtitle: subtitle,
      content: content,
      createdAt: createdAt,
      tags: tags,
      comments: [], // comments.map((e) => e.toDto()).toList(),
      bannerImageUrl: bannerImageUrl,
    );
  }
}

extension CommentDtoMapper on Comment {
  CommentDto toDto() {
    return CommentDto(
      id: id,
      content: content,
      createdAt: createdAt,
      authorName: authorName,
      authorEmail: authorEmail,
    );
  }
}

extension NewsDtoMapper on NewsEntry {
  NewsDto toDto() {
    return NewsDto(
      id: id,
      content: content,
      createdAt: createdAt,
    );
  }
}

extension NewsEntryMapper on NewsDto {
  Future<NewsEntry> toEntity() async {
    return NewsEntry(
      id: id,
      content: content,
      createdAt: createdAt,
    );
  }
}
