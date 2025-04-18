//A widget that shows a list of entries with comments.
//Each entry is collapsed and only shows its title, then can be expanded to show its subtitle and comments.
//Each comment is an item with author, date, and text (content).
//Comments are nested to their owner entry

import 'package:flutter/material.dart';
import 'package:javier_website/model/entry.dart';
import 'package:javier_website/view/blog/entry_detail_page.dart';
import 'package:javier_website/view/themes/app_theme.dart';

class ResumedEntries extends StatefulWidget {
  final List<Entry> entries;

  const ResumedEntries({super.key, required this.entries});

  @override
  State<ResumedEntries> createState() => _ResumedEntriesState();
}

class _ResumedEntriesState extends State<ResumedEntries> {
  int _expandedIndex = -1;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
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
              );
            },
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row(
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                //       child: Text(entryData.subtitle,
                //           style: TextStyle(
                //               color: AppTheme.lightTheme.colorScheme.primary,
                //               fontSize: 16,
                //               fontWeight: FontWeight.normal)),
                //     ),
                //   ],
                // ),
                //const Divider(),

                SizedBox(height: screenHeight, child: EntryDetailPage(id: entryData.id))
                // Row(
                //   children: [
                //     Expanded(
                //       child: MouseRegion(
                //         cursor: SystemMouseCursors.click,
                //         child: GestureDetector(
                //           onTap: () {
                //             context.pushNamed(RoutNames.blogEntry,
                //                 pathParameters: {
                //                   'id': entryData.id,
                //                 },
                //                 extra: entryData);
                //           },
                //           child: Container(
                //             color: Colors.black.withAlpha(200),
                //             child: Padding(
                //               padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                //               child: Text(localizations.read_more,
                //                   style: TextStyle(
                //                     color: AppTheme.lightTheme.colorScheme.primary,
                //                     fontSize: 18,
                //                     fontWeight: FontWeight.normal,
                //                   )),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
