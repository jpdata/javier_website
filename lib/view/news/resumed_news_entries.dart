//A widget that shows a list of entries with comments.
//Each entry is collapsed and only shows its title, then can be expanded to show its subtitle and comments.
//Each comment is an item with author, date, and text (content).
//Comments are nested to their owner entry

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/model/news_entry.dart';
import 'package:javier_website/router/rout_names.dart';
import 'package:javier_website/view/themes/app_theme.dart';
import 'package:javier_website/viewmodel/news/news_entries_view_model.dart';

class ResumedNewsEntries extends ConsumerStatefulWidget {
  final List<NewsEntry> entries;

  const ResumedNewsEntries({super.key, required this.entries});

  @override
  ConsumerState<ResumedNewsEntries> createState() => _ResumedNewsEntriesState();
}

class _ResumedNewsEntriesState extends ConsumerState<ResumedNewsEntries> {
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
                leading: Icon(Icons.article_outlined, color: AppTheme.lightTheme.colorScheme.primary),
                title: Text(
                  entryData.createdAt.toString(),
                  style: TextStyle(color: AppTheme.lightTheme.colorScheme.primary, fontSize: 18),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.delete, color: AppTheme.lightTheme.colorScheme.primary),
                      onPressed: () async {
                        final confirmed = await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Confirmar eliminación'),
                            content: const Text('¿Estás seguro de que deseas borrar esta entrada?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(false),
                                style: AppTheme.lightTheme.elevatedButtonTheme.style,
                                child: const Text('Cancelar'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(true),
                                style: TextButton.styleFrom(
                                  backgroundColor: AppTheme.lightTheme.colorScheme.primary,
                                  foregroundColor: AppTheme.lightTheme.colorScheme.onPrimary,
                                ),
                                child: const Text('Borrar'),
                              ),
                            ],
                          ),
                        );
                        if (confirmed == true) {
                          setState(() {
                            var newsEntryVm = ref.read(newsEntriesViewModelProvider().notifier);
                            newsEntryVm.deleteEntry(entryData.id);
                            widget.entries.removeAt(index);
                            _expanded.remove(index);
                          });
                        }
                      },
                    ),
                  ],
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
                        child: GestureDetector(
                          onTap: () {
                            context.pushNamed(
                              RoutNames.newsEntry,
                              pathParameters: {'id': entryData.id},
                            );
                          },
                          child: Container(
                            color: Colors.black.withAlpha(128),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                              child: Text(localizations.read_more,
                                  style: TextStyle(
                                    color: AppTheme.lightTheme.colorScheme.primary,
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                  )),
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
