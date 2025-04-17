//A widget that shows a list of entries with comments.
//Each entry is collapsed and only shows its title, then can be expanded to show its subtitle and comments.
//Each comment is an item with author, date, and text (content).
//Comments are nested to their owner entry

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/model/news_entry.dart';
import 'package:javier_website/view/themes/app_theme.dart';

class NewsEntries extends ConsumerStatefulWidget {
  final List<NewsEntry> entries;

  const NewsEntries({super.key, required this.entries});

  @override
  ConsumerState<NewsEntries> createState() => _NewsEntriesState();
}

class _NewsEntriesState extends ConsumerState<NewsEntries> {
  final Map<int, bool> _expanded = {};

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        expansionCallback: (panelIndex, isExpanded) {
          setState(() {
            _expanded[panelIndex] = !(_expanded[panelIndex] ?? false);
          });
        },
        children: widget.entries.asMap().entries.map((entry) {
          final index = entry.key;
          final entryData = entry.value;
          final isExpanded = _expanded[index] ?? true;

          return ExpansionPanel(
            isExpanded: isExpanded,
            backgroundColor: Colors.black.withAlpha(25),
            canTapOnHeader: true,
            headerBuilder: (context, isExpanded) {
              return ListTile(
                leading: Icon(Icons.article_outlined, color: AppTheme.lightTheme.colorScheme.primary),
                title: Text(
                  localizations.news_on(entryData.createdAt),
                  style: TextStyle(color: AppTheme.lightTheme.colorScheme.primary, fontSize: 18),
                ),
              );
            },
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          color: Colors.black.withAlpha(128),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                            child: Html(data: entryData.content
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
