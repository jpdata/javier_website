import 'package:flutter/material.dart';
import 'package:javier_website/core/blog_mappers.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/data/firestore_client.dart';
import 'package:javier_website/model/entry.dart';
import 'package:javier_website/view/Themes/app_theme.dart';
import 'package:javier_website/view/widgets/common_scaffold.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class NewsNewEntryPage extends StatefulWidget {
  const NewsNewEntryPage({super.key});

  @override
  State<NewsNewEntryPage> createState() => _NewsNewEntryPageState();
}

class _NewsNewEntryPageState extends State<NewsNewEntryPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _subtitleController = TextEditingController();
  final _contentController = TextEditingController();
  final _contentHtmlController = HtmlEditorController();
  final _bannerImageUrlController = TextEditingController();
  final _tagsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return CommonScaffold(
      showBackButton: true,
      child: Padding(
        padding:
            EdgeInsets.fromLTRB(screenWidth * .10, 8, screenWidth * .10, 8),
        child: Form(
          key: _formKey,
          child: SizedBox(
            width: screenWidth * .80,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  HtmlEditor(
                    controller: _contentHtmlController, //required
                    htmlEditorOptions: HtmlEditorOptions(
                      hint: localizations.content,
                      //initalText: "text content initial, if any",
                    ),
                    otherOptions: const OtherOptions(
                      height: 400,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: AppTheme.lightTheme.elevatedButtonTheme.style,
                    // (
                    //   textStyle: Theme.of(context).textTheme.labelLarge,
                    //   backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    //   foregroundColor: Theme.of(context).colorScheme.primary,
                    // ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final newEntry = Entry(
                          id: '',
                          title: _titleController.text,
                          subtitle: _subtitleController.text,
                          content: _contentHtmlController.toString(),
                          createdAt: DateTime.now(),
                          bannerImageUrl: _bannerImageUrlController.text,
                          tags: _tagsController.text
                              .split(',')
                              .map((tag) => tag.trim())
                              .toList(),
                          comments: [],
                        );
                        // Handle the new entry (e.g., save to database)
                        await EntriesCollectionReference()
                            .add(newEntry.toDto());
                      }
                    },
                    child: Text(localizations.saveEntry),
                  ),
                ],
              ),
            ),
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
