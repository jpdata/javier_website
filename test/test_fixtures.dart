import 'package:javier_website/model/entry.dart';
import 'package:javier_website/model/news_entry.dart';

/// Test fixtures for common test data
class TestFixtures {
  // Mock Entry
  static Entry get mockEntry => Entry(
    id: 'entry-1',
    title: 'Test Entry',
    subtitle: 'Test Subtitle',
    bannerImageUrl: 'https://example.com/banner.jpg',
    content: 'Test content',
    createdAt: DateTime(2024, 1, 1),
    tags: const ['test', 'fixture'],
    comments: const [],
  );

  // Mock News Entry
  static NewsEntry get mockNewsEntry => NewsEntry(
    id: 'news-1',
    content: 'Test news content',
    createdAt: DateTime(2024, 1, 1),
    tags: const ['news', 'test'],
    comments: const [],
  );

  // Multiple mock entries for list tests
  static List<Entry> get mockEntries => [
    mockEntry,
    Entry(
      id: 'entry-2',
      title: 'Second Entry',
      subtitle: 'Another Subtitle',
      bannerImageUrl: 'https://example.com/banner2.jpg',
      content: 'More content',
      createdAt: DateTime(2024, 1, 2),
      tags: const ['test'],
      comments: const [],
    ),
  ];

  // Multiple mock news entries
  static List<NewsEntry> get mockNewsEntries => [
    mockNewsEntry,
    NewsEntry(
      id: 'news-2',
      content: 'Another news entry',
      createdAt: DateTime(2024, 1, 2),
      tags: const ['update'],
      comments: const [],
    ),
  ];
}
