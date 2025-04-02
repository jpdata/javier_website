//A widget that shows a list of entries with comments.
//Each entry is collapsed and only shows its title, then can be expanded to show its subtitle and comments.
//Each comment is an item with author, date, and text (content).
//Comments are nested to their owner entry

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/model/entry.dart';
import 'package:javier_website/router/rout_names.dart';

class ResumedNewsEntries extends StatefulWidget {
  final List<Entry> entries;

  const ResumedNewsEntries({super.key, required this.entries});

  @override
  State<ResumedNewsEntries> createState() => _ResumedNewsEntriesState();
}

class _ResumedNewsEntriesState extends State<ResumedNewsEntries> {
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
          final isExpanded = _expanded[index] ?? false;

          return ExpansionPanel(
            isExpanded: isExpanded,
            backgroundColor: Colors.black.withAlpha(25),
            canTapOnHeader: true,
            headerBuilder: (context, isExpanded) {
              return ListTile(
                leading:
                    const Icon(Icons.article_outlined, color: Colors.white),
                title: Text(
                  entryData.title,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              );
            },
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                      child: Text(entryData.subtitle),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            context.pushNamed(RoutNames.blogEntry,
                                extra: entryData);
                          },
                          child: Container(
                            color: Colors.black.withAlpha(128),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                              child: Text(localizations.read_more,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal)),
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
