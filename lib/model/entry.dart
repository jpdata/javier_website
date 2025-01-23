import 'package:javier_website/model/comment.dart';

class Entry {
  final String id;
  final String title;
  final String subtitle;
  final String content;
  final List<String> tags;
  final List<Comment> comments;

  Entry(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.content,
      this.tags = const [],
      this.comments = const []});
}
