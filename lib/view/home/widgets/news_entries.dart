//A widget that shows a news ticker/marquee with all entries.
//News scrolls horizontally like a Wall Street ticker.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:javier_website/model/news_entry.dart';
import 'package:javier_website/view/home/widgets/news_ticker.dart';

class NewsEntries extends ConsumerStatefulWidget {
  final List<NewsEntry> entries;

  const NewsEntries({super.key, required this.entries});

  @override
  ConsumerState<NewsEntries> createState() => _NewsEntriesState();
}

class _NewsEntriesState extends ConsumerState<NewsEntries> {
  @override
  Widget build(BuildContext context) {
    return NewsTicker(entries: widget.entries);
  }
}
