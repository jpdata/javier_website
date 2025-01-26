import 'package:flutter/material.dart';
import 'package:javier_website/model/entry.dart';

class EntryWidget extends StatefulWidget {
  final Entry entry;

  const EntryWidget({super.key, required this.entry});

  @override
  _EntryWidgetState createState() => _EntryWidgetState();
}

class _EntryWidgetState extends State<EntryWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.entry.title,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              if (_isExpanded) ...[
                Text(
                  widget.entry.subtitle,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  widget.entry.content,
                  style: const TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 10.0),
                const Divider(),
                const Text(
                  'Comments:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                ...widget.entry.comments.map((comment) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(comment.content),
                    )),
              ],
            ],
          ),
        ),
      ),
    );
  }
}