import 'package:flutter/material.dart';
import 'package:javier_website/core/blog_mappers.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/data/firestore_client.dart';
import 'package:javier_website/model/entry.dart';
import 'package:javier_website/view/Themes/app_theme.dart';
import 'package:javier_website/view/widgets/common_scaffold.dart';
import 'package:html_editor_enhanced/html_editor.dart';

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
                  TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: localizations.entryTitle,
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.onPrimary,
                      labelStyle: const TextStyle(fontFamily: 'Roboto'),
                    ),
                    style: const TextStyle(fontFamily: 'Roboto'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return localizations.pleaseEnterTitle;
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _subtitleController,
                    decoration: InputDecoration(
                      labelText: localizations.subtitle,
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.onPrimary,
                      labelStyle: const TextStyle(fontFamily: 'Roboto'),
                    ),
                    style: const TextStyle(fontFamily: 'Roboto'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return localizations.pleaseEnterSubtitle;
                      }
                      return null;
                    },
                  ),
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
                  const SizedBox(height: 2),
                  TextFormField(
                    controller: _bannerImageUrlController,
                    decoration: InputDecoration(
                      labelText: localizations.bannerImageUrl,
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.onPrimary,
                      labelStyle: const TextStyle(fontFamily: 'Roboto'),
                    ),
                    style: const TextStyle(fontFamily: 'Roboto'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return localizations.pleaseEnterBannerImageUrl;
                      }
                      return null;
                    },
                  ),
                  //TODO use --> textfield_tags: ^3.0.1
                  TextFormField(
                    controller: _tagsController,
                    decoration: InputDecoration(
                      labelText: localizations.tags,
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.onPrimary,
                      labelStyle: const TextStyle(fontFamily: 'Roboto'),
                    ),
                    style: const TextStyle(fontFamily: 'Roboto'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: AppTheme.lightTheme.elevatedButtonTheme.style,
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
