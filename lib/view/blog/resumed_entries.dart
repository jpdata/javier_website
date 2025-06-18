import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:javier_website/core/enums/role.dart';
import 'package:javier_website/model/entry.dart';
import 'package:javier_website/model/user.dart';
import 'package:javier_website/view/blog/entry_detail_page.dart';
import 'package:javier_website/view/themes/app_theme.dart';
import 'package:javier_website/viewmodel/blog/entries_view_model.dart';
import 'package:javier_website/viewmodel/user/user_view_model.dart';

class ResumedEntries extends ConsumerStatefulWidget {
  final List<Entry> entries;

  final bool showLoggedActions;

  const ResumedEntries({super.key, required this.entries, this.showLoggedActions = true});

  @override
  ConsumerState<ResumedEntries> createState() => _ResumedEntriesState();
}

class _ResumedEntriesState extends ConsumerState<ResumedEntries> {
  int _expandedIndex = -1;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    var currentUser = ref.watch(currentUserProvider);

    return currentUser.when(
      data: (user) {
        return _content(screenHeight, user);
      },
      error: (error, stackTrace) {
        return Center(child: Text('Error: $error'));
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  SingleChildScrollView _content(double screenHeight, User user) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
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
            backgroundColor: Colors.black.withAlpha(128),
            canTapOnHeader: true,
            headerBuilder: (context, isExpanded) {
              return ListTile(
                leading: Icon(
                  Icons.article_outlined,
                  color: AppTheme.lightTheme.colorScheme.primary,
                ),
                title: Text(
                  entryData.title,
                  style: TextStyle(
                    color: AppTheme.lightTheme.colorScheme.primary,
                    fontSize: 18,
                  ),
                ),
                trailing: widget.showLoggedActions
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (user.role == Role.admin)
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [SizedBox(height: screenHeight, child: EntryDetailPage(id: entryData.id))],
            ),
          );
        }).toList(),
      ),
    );
  }
}
