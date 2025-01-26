import 'package:flutter/material.dart';
import 'package:javier_website/model/comment.dart';
import 'package:javier_website/model/entry.dart';

class NewCommentWidget extends StatefulWidget {
  final Entry entry;
  final Function(Comment) onCommentAdded;

  const NewCommentWidget({
    super.key,
    required this.entry,
    required this.onCommentAdded,
  });

  @override
  State<NewCommentWidget> createState() => _NewCommentWidgetState();
}

class _NewCommentWidgetState extends State<NewCommentWidget> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final newComment = Comment(
        content: _contentController.text,
        createdAt: DateTime.now(),
        authorName: _nameController.text,
        authorEmail: _emailController.text,
      );
      widget.onCommentAdded(newComment);
      _emailController.clear();
      _nameController.clear();
      _contentController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _contentController,
            decoration: const InputDecoration(labelText: 'Comment'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your comment';
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: _submitForm,
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
