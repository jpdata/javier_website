import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/model/news_entry.dart';
import 'package:javier_website/view/themes/app_theme.dart';
import 'package:javier_website/view/widgets/common_scaffold.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:javier_website/viewmodel/news/news_entries_view_model.dart';

class NewsNewEntryPage extends ConsumerStatefulWidget {
  const NewsNewEntryPage({super.key});

  @override
  ConsumerState<NewsNewEntryPage> createState() => _NewsNewEntryPageState();
}

class _NewsNewEntryPageState extends ConsumerState<NewsNewEntryPage> {
  final _formKey = GlobalKey<FormState>();
  final _contentHtmlController = HtmlEditorController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return CommonScaffold(
      showBackButton: true,
      child: Padding(
        padding: EdgeInsets.fromLTRB(screenWidth * .10, 8, screenWidth * .10, 8),
        child: Form(
          key: _formKey,
          child: SizedBox(
            width: screenWidth * .80,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  _htmlEditorField(),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: AppTheme.lightTheme.elevatedButtonTheme.style,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final newEntry = NewsEntry(
                          id: '',
                          content: await _contentHtmlController.getText(),
                          createdAt: DateTime.now(),
                        );
                        var newsEntryVm = ref.read(newsEntriesViewModelProvider().notifier);
                        newsEntryVm.createEntry(newEntry);
                        if (context.mounted) {
                          context.pop();
                        }
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

  Widget _htmlEditorField() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: HtmlEditor(
        controller: _contentHtmlController,
        htmlToolbarOptions: HtmlToolbarOptions(
          defaultToolbarButtons: [
            const StyleButtons(),
            const FontSettingButtons(),
            const ColorButtons(),
            const InsertButtons(),
            const OtherButtons(),
          ],
          toolbarPosition: ToolbarPosition.belowEditor,
          toolbarType: ToolbarType.nativeScrollable,
          textStyle: TextStyle(
            fontFamily: 'Roboto',
            color: AppTheme.lightTheme.colorScheme.secondary,
          ),
          dropdownBackgroundColor: AppTheme.lightTheme.colorScheme.primary,
          onButtonPressed: (button, controller, focusNode) {
            return true;
          },
        ),
        htmlEditorOptions: HtmlEditorOptions(
          hint: localizations.content,
          //initalText: "text content initial, if any",
        ),
        otherOptions: OtherOptions(
//          height: 400,

          decoration: BoxDecoration(
            color: AppTheme.lightTheme.colorScheme.primary,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
        ),
      ),
    );
  }
}
