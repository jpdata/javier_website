

import 'package:javier_website/model/author.dart';
import 'package:javier_website/model/entry.dart';

class Comment {
  final String id;
  final Entry entry;
  final Author author;
  final String content;
  final DateTime createdAt;

  Comment({
    required this.id,
    required this.entry,
    required this.author,
    required this.content,
    required this.createdAt,
  });

}