import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/router/rout_names.dart';
import 'package:javier_website/view/themes/app_theme.dart';
import 'package:javier_website/view/blog/resumed_entries_from_firebase.dart';
import 'package:javier_website/view/widgets/common_scaffold.dart';

class BlogEntriesListPage extends StatelessWidget {
  const BlogEntriesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return CommonScaffold(
      showBackButton: true,
      child: Padding(
        padding: EdgeInsets.fromLTRB(screenWidth * .10, 8, screenWidth * .10, 0),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(localizations.blog_entries,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.lightTheme.colorScheme.secondary,
                            )),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const ResumedEntriesFromFirebase(),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            context.pushNamed(RoutNames.blogNewEntry);
                          },
                          style: AppTheme.lightTheme.elevatedButtonTheme.style,
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
