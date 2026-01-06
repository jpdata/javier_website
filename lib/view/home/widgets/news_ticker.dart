import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:developer' as developer;
import 'package:javier_website/model/news_entry.dart';
import 'package:javier_website/view/themes/app_theme.dart';

class NewsTicker extends StatefulWidget {
  final List<NewsEntry> entries;
  final Duration scrollDuration;

  const NewsTicker({super.key, required this.entries, this.scrollDuration = const Duration(seconds: 30)});

  @override
  State<NewsTicker> createState() => _NewsTickerState();
}

class _NewsTickerState extends State<NewsTicker> {
  late ScrollController _scrollController;
  Timer? _scrollTimer;
  double _maxScroll = 0;
  double _currentScroll = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startScrolling();
    });
  }

  void _startScrolling() {
    if (!_scrollController.hasClients) return;

    _maxScroll = _scrollController.position.maxScrollExtent;
    if (_maxScroll <= 0) return;

    _scrollTimer?.cancel();
    _scrollTimer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (!mounted || !_scrollController.hasClients) {
        timer.cancel();
        return;
      }

      try {
        _currentScroll += (_maxScroll / (widget.scrollDuration.inMilliseconds / 50));

        if (_currentScroll >= _maxScroll) {
          _currentScroll = 0;
        }

        _scrollController.jumpTo(_currentScroll);
      } catch (e) {
        developer.log('Error en NewsTicker: $e');
      }
    });
  }

  @override
  void dispose() {
    _scrollTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.entries.isEmpty) {
      return const SizedBox.shrink();
    }

    final tickerText = widget.entries
        .map((entry) {
          final dateStr =
              '${entry.createdAt.year}-${entry.createdAt.month.toString().padLeft(2, '0')}-${entry.createdAt.day.toString().padLeft(2, '0')}';
          final content = entry.content.replaceAll(RegExp(r'<[^>]*>'), '').trim();
          return '[$dateStr] $content';
        })
        .join(' • ')
        .replaceAll('\n', ' ');

    return Container(
      color: AppTheme.lightTheme.colorScheme.primary.withAlpha(50),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        child: Row(
          children: [
            Text(
              tickerText,
              style: TextStyle(
                color: AppTheme.lightTheme.colorScheme.secondary,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.fade,
            ),
            const SizedBox(width: 32),
            Text(
              tickerText,
              style: TextStyle(
                color: AppTheme.lightTheme.colorScheme.secondary,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.fade,
            ),
          ],
        ),
      ),
    );
  }
}
