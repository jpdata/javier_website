import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:javier_website/data/comment_dto.dart';
import 'package:javier_website/data/entry_dto.dart';
import 'package:javier_website/model/comment.dart';
import 'package:javier_website/model/entry.dart';

extension CommentMapper on CommentDto {
  Comment toEntity() {
    var data = toJson();
    return Comment(
      content: data['content'],
      createdAt: data['createdAt'].toDate(),
      authorName: data['authorName'],
      authorEmail: data['authorEmail'],
    );
  }
}

extension EntryMapper on EntryDto {
  Entry toEntity() {
    return Entry(
      title: title,
      subtitle: subtitle,
      content: content,
      tags: tags,
      comments: List<Comment>.from(
          comments.map((e) => e.get().then((value) => value.data?.toEntity()))),
    );
  }
}
