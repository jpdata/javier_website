import 'package:flutter/material.dart';
import 'package:javier_website/core/blog_mappers.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/data/firestore_client.dart';
import 'package:javier_website/model/entry.dart';
import 'package:javier_website/view/widgets/common_scaffold.dart';

class NewEntryPage extends StatefulWidget {
  const NewEntryPage({super.key});

  @override
  State<NewEntryPage> createState() => _NewEntryPageState();
}

class _NewEntryPageState extends State<NewEntryPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _subtitleController = TextEditingController();
  final _contentController = TextEditingController();
  final _bannerImageUrlController = TextEditingController();
  final _tagsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      showBackButton: true,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: localizations.title),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return localizations.pleaseEnterTitle;
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _subtitleController,
                decoration: InputDecoration(labelText: localizations.subtitle),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return localizations.pleaseEnterSubtitle;
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _contentController,
                decoration: InputDecoration(labelText: localizations.content),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return localizations.pleaseEnterContent;
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _bannerImageUrlController,
                decoration:
                    InputDecoration(labelText: localizations.bannerImageUrl),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return localizations.pleaseEnterBannerImageUrl;
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _tagsController,
                decoration: InputDecoration(labelText: localizations.tags),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final newEntry = Entry(
                      title: _titleController.text,
                      subtitle: _subtitleController.text,
                      content: _contentController.text,
                      createdAt: DateTime.now(),
                      bannerImageUrl: _bannerImageUrlController.text,
                      tags: _tagsController.text
                          .split(',')
                          .map((tag) => tag.trim())
                          .toList(),
                      comments: [],
                    );
                    // Handle the new entry (e.g., save to database)
                    await EntriesCollectionReference().add(newEntry.toDto());
                  }
                },
                child: Text(localizations.saveEntry),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _subtitleController.dispose();
    _contentController.dispose();
    _bannerImageUrlController.dispose();
    _tagsController.dispose();
    super.dispose();
  }
}
