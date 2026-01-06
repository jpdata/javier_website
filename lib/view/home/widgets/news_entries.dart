//A widget that shows a news ticker/marquee with all entries.
//News scrolls horizontally like a Wall Street ticker.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:javier_website/model/news_entry.dart';
import 'package:marquee/marquee.dart';

class NewsEntries extends ConsumerStatefulWidget {
  final List<NewsEntry> entries;

  const NewsEntries({super.key, required this.entries});

  @override
  ConsumerState<NewsEntries> createState() => _NewsEntriesState();
}

class _NewsEntriesState extends ConsumerState<NewsEntries> {
  @override
  Widget build(BuildContext context) {
    final tickerText = widget.entries
        .map((entry) {
          final dateStr =
              '${entry.createdAt.year}-${entry.createdAt.month.toString().padLeft(2, '0')}-${entry.createdAt.day.toString().padLeft(2, '0')}';
          final content = entry.content.replaceAll(RegExp(r'<[^>]*>'), '').trim();
          return '[$dateStr] $content';
        })
        .join(' • ')
        .replaceAll('\n', ' ');
    return SizedBox(
      height: 32.0, // Set a fixed height for the Marquee
      child: Marquee(
        text: tickerText,
        style: TextStyle(fontWeight: FontWeight.bold),
        scrollAxis: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        blankSpace: 20.0,
        velocity: 50.0,
        pauseAfterRound: Duration(seconds: 1),
        startPadding: 10.0,
        accelerationDuration: Duration(seconds: 1),
        accelerationCurve: Curves.linear,
        decelerationDuration: Duration(milliseconds: 500),
        decelerationCurve: Curves.easeOut,
      ),
    );
    //return NewsTicker(entries: widget.entries);
  }
}
