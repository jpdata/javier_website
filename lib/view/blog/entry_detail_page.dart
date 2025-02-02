import 'package:flutter/material.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/model/entry.dart';
import 'package:javier_website/view/widgets/common_scaffold.dart';

class EntryDetailPage extends StatelessWidget {
  final Entry entry;

  const EntryDetailPage({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      showBackButton: true,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (entry.bannerImageUrl.isNotEmpty)
                Image.network(entry.bannerImageUrl),
              const SizedBox(height: 16),
              Text(
                entry.title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                entry.subtitle,
                style:
                    const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 16),
              Text(entry.content),
              const SizedBox(height: 16),
              const Divider(),
              const Text(
                'Comments',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ...entry.comments.map((comment) {
                return ListTile(
                  title: Text(localizations.comment_title(
                      comment.authorName, comment.createdAt)),
                  subtitle: Text(comment.content),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
