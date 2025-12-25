import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:javier_website/core/analytics_service.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/router/rout_names.dart';
import 'package:javier_website/view/themes/app_theme.dart';
import 'package:javier_website/view/widgets/common_scaffold.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:javier_website/viewmodel/news/news_entries_view_model.dart';
//import 'package:flutter_html_all/flutter_html_all.dart';

class NewsEntryDetailPage extends ConsumerWidget {
  final String entryId;

  const NewsEntryDetailPage({super.key, required this.entryId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entry = ref.watch(selectedNewsEntryByIdProvider(entryId));

    if (entry == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    AnalyticsService.logPageView(pageName: 'news_entry_detail', pageClass: 'NewsEntryDetail');

    double screenWidth = MediaQuery.of(context).size.width;

    return CommonScaffold(
      showBackButton: true,
      child: Padding(
        padding: EdgeInsets.fromLTRB(screenWidth * .10, 8, screenWidth * .10, 8),
        child: Row(
          children: [
            SizedBox(
              width: screenWidth * .80,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppTheme.lightTheme.colorScheme.secondary),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text(
                                entry.createdAt.toString(),
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.lightTheme.colorScheme.secondary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppTheme.lightTheme.colorScheme.primary,
                            ),
                            child: Html(
                              data: entry.content,
                              style: {
                                "body": Style(
                                  backgroundColor: Colors.white,
                                  color: Colors.black,
                                  fontFamily: 'Roboto',
                                ),
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () async {
                        await context.pushNamed(RoutNames.newsEditEntry, extra: entry);
                        // Al volver, ya no necesitas hacer pop ni nada más
                        // La vista se actualizará automáticamente gracias a Riverpod
                      },
                      style: AppTheme.lightTheme.elevatedButtonTheme.style,
                      child: Text(localizations.news_edit_entry),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
