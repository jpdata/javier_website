import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:javier_website/model/entry.dart';
import 'package:javier_website/view/blog/entry_detail_widget.dart';
import 'package:javier_website/view/themes/app_theme.dart';
import 'package:javier_website/viewmodel/blog/entries_view_model.dart';

class ResumedBlogEntries extends ConsumerStatefulWidget {
  final List<Entry> entries;
  final bool showEditAction;
  final bool showCreateAction;
  final bool showDeleteAction;
  final bool showLoggedActions;
  final bool hasPreviousPage;
  final bool hasNextPage;

  const ResumedBlogEntries({
    super.key,
    required this.entries,
    this.showCreateAction = false,
    this.showEditAction = false,
    this.showDeleteAction = false,
    this.showLoggedActions = true,
    this.hasPreviousPage = false,
    this.hasNextPage = false,
  });

  @override
  ConsumerState<ResumedBlogEntries> createState() => _ResumedBlogEntriesState();
}

class _ResumedBlogEntriesState extends ConsumerState<ResumedBlogEntries> {
  int _expandedIndex = -1;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return _content(screenHeight, widget.showCreateAction, widget.showEditAction, widget.showDeleteAction);
  }

  Widget _content(double screenHeight, bool showCreateAction, bool showEditAction, bool showDeleteAction) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ExpansionPanelList(
            expansionCallback: (panelIndex, isExpanded) {
              setState(() {
                _expandedIndex = isExpanded ? panelIndex : -1;
              });
            },
            children: widget.entries.asMap().entries.map((entry) {
              final index = entry.key;
              final entryData = entry.value;
              final isExpanded = _expandedIndex == index;

              return ExpansionPanel(
                isExpanded: isExpanded,
                backgroundColor: Colors.black.withAlpha(0),
                canTapOnHeader: true,
                headerBuilder: (context, isExpanded) {
                  return ListTile(
                    leading: Icon(Icons.article_outlined, color: AppTheme.lightTheme.colorScheme.primary),
                    title: Text(
                      entryData.title,
                      style: TextStyle(color: AppTheme.lightTheme.colorScheme.primary, fontSize: 18),
                    ),
                    trailing: widget.showLoggedActions
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (showDeleteAction)
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
                                            child: const Text('Cancelar'),
                                          ),
                                          TextButton(
                                            onPressed: () => Navigator.of(context).pop(true),
                                            child: const Text('Borrar'),
                                          ),
                                        ],
                                      ),
                                    );
                                    if (confirmed == true) {
                                      setState(() {
                                        var entryVm = ref.read(entriesViewModelProvider().notifier);
                                        entryVm.deleteEntry(entryData.id);
                                        widget.entries.removeAt(index);
                                        _expandedIndex = -1;
                                      });
                                    }
                                  },
                                ),
                            ],
                          )
                        : null,
                  );
                },
                body: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [EntryDetailWidget(entry: entryData, showEditEntryButton: widget.showEditAction)],
                ),
              );
            }).toList(),
          ),
          // Pagination buttons
          if (widget.entries.isNotEmpty && (widget.hasPreviousPage || widget.hasNextPage))
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.hasPreviousPage)
                    ElevatedButton.icon(
                      onPressed: () {
                        ref.read(entriesViewModelProvider().notifier).loadPreviousPage();
                      },
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Anterior'),
                    ),
                  if (widget.hasPreviousPage && widget.hasNextPage) const SizedBox(width: 16),
                  if (widget.hasNextPage)
                    ElevatedButton.icon(
                      onPressed: () {
                        ref.read(entriesViewModelProvider().notifier).loadNextPage();
                      },
                      icon: const Icon(Icons.arrow_forward),
                      label: const Text('Siguiente'),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
