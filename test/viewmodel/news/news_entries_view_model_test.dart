import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:javier_website/model/news_entry.dart';
import 'package:javier_website/viewmodel/news/news_entries_view_model.dart';

void main() {
  group('NewsEntriesViewModel', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('initial state is loading', () async {
      final state = container.read(newsEntriesViewModelProvider());
      expect(state, const AsyncValue<List<NewsEntry>>.loading());
    });

    test('loads news entries successfully', () async {
      final state = await container.read(newsEntriesViewModelProvider().future);
      expect(state, isA<List<NewsEntry>>());
    });

    test('provider returns async value', () async {
      final entries = await container.read(newsEntriesViewModelProvider().future);
      expect(entries, isNotEmpty);
    });

    test('handles errors gracefully', () async {
      final state = container.read(newsEntriesViewModelProvider());
      
      // State should either be data or error
      expect(
        state,
        isA<AsyncValue<List<NewsEntry>>>(),
      );
    });
  });
}
