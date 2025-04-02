import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/router/rout_names.dart';
import 'package:javier_website/view/news/resumed_entries_from_firebase.dart';
import 'package:javier_website/view/widgets/common_scaffold.dart';

class BlogEntriesListPage extends ConsumerWidget {
  const BlogEntriesListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenWidth = MediaQuery.of(context).size.width;

    return CommonScaffold(
      showBackButton: true,
      child: Padding(
        padding:
            EdgeInsets.fromLTRB(screenWidth * .10, 8, screenWidth * .10, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: screenWidth * .80,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const ResumedNewsEntriesFromFirebase(),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            context.pushNamed(RoutNames.blogNewEntry);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.onPrimary,
                            foregroundColor:
                                Theme.of(context).colorScheme.primary,
                          ),
                          child: Text(localizations.newEntry),
                        ),
                      ],
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
