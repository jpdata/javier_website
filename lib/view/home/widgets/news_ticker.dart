import 'package:flutter/material.dart';
import 'package:javier_website/model/news_entry.dart';
import 'package:javier_website/view/themes/app_theme.dart';

class NewsTicker extends StatefulWidget {
  final List<NewsEntry> entries;
  final Duration scrollDuration;

  const NewsTicker({
    super.key,
    required this.entries,
    this.scrollDuration = const Duration(seconds: 30),
  });

  @override
  State<NewsTicker> createState() => _NewsTickerState();
}

class _NewsTickerState extends State<NewsTicker> with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.scrollDuration,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startScrolling();
    });
  }

  void _startScrolling() {
    if (_scrollController.hasClients) {
      _animationController.forward().then((_) {
        if (mounted) {
          _scrollController.jumpTo(0);
          _animationController.reset();
          _startScrolling();
        }
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.entries.isEmpty) {
      return const SizedBox.shrink();
    }

    final tickerText = widget.entries
        .map((entry) {
          final dateStr = '${entry.createdAt.year}-${entry.createdAt.month.toString().padLeft(2, '0')}-${entry.createdAt.day.toString().padLeft(2, '0')}';
          final content = entry.content.replaceAll(RegExp(r'<[^>]*>'), '').trim();
          return '[$dateStr] $content';
        })
        .join(' • ')
        .replaceAll('\n', ' ');

    return Container(
      color: AppTheme.lightTheme.colorScheme.primary.withAlpha(50),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          return false;
        },
        child: SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              final maxScroll = _scrollController.position.maxScrollExtent;
              final currentScroll = _animationController.value * maxScroll;
              _scrollController.jumpTo(currentScroll);
              return child!;
            },
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
        ),
      ),
    );
  }
}
