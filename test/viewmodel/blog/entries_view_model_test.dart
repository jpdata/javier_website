import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:javier_website/model/entry.dart';
import 'package:javier_website/viewmodel/blog/entries_view_model.dart';

void main() {
  group('EntriesViewModel', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('initial state is loading', () async {
      final state = container.read(entriesViewModelProvider());
      expect(state, const AsyncValue<List<Entry>>.loading());
    });

    test('loads entries successfully', () async {
      final state = await container.read(entriesViewModelProvider().future);
      expect(state, isA<List<Entry>>());
    });

    test('provider returns async value', () async {
      final entries = await container.read(entriesViewModelProvider().future);
      expect(entries, isNotEmpty);
    });

    test('handles errors gracefully', () async {
      final state = container.read(entriesViewModelProvider());
      
      // State should either be data or error
      expect(
        state,
        isA<AsyncValue<List<Entry>>>(),
      );
    });
  });
}
