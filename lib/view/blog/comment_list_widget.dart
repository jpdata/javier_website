import 'package:flutter/material.dart';
import 'package:javier_website/model/comment.dart';
import 'package:javier_website/model/entry.dart';
import 'package:javier_website/view/blog/new_comment_widget.dart';
import 'package:javier_website/view/blog/comment_widget.dart';

class CommentListWidget extends StatefulWidget {
  final Entry entry;
  final List<Comment> comments;

  const CommentListWidget({
    super.key,
    required this.entry,
    required this.comments,
  });

  @override
  State<CommentListWidget> createState() => _CommentListWidgetState();
}

class _CommentListWidgetState extends State<CommentListWidget> {
  List<Comment> _comments = [];

  @override
  void initState() {
    super.initState();
    _comments = widget.comments;
  }

  void _addComment(Comment comment) {
    setState(() {
      _comments.add(comment);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewCommentWidget(
          entry: widget.entry,
          onCommentAdded: _addComment,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _comments.length,
            itemBuilder: (context, index) {
              return CommentWidget(comment: _comments[index]);
            },
          ),
        ),
      ],
    );
  }
}
