import 'package:javier_website/core/blog_mappers.dart';
import 'package:javier_website/data/firestore_client.dart';
import 'package:javier_website/model/news_entry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'news_entries_view_model.g.dart';

final NewsCollectionReference _newsEntriesCollection = NewsCollectionReference();

@riverpod
NewsEntry? selectedNewsEntryById(Ref ref, String id) {
  final entriesAsync = ref.watch(newsEntriesViewModelProvider());
  return entriesAsync.maybeWhen(
    data: (entries) =>
        entries.firstWhere((e) => e.id == id, orElse: () => throw StateError('No NewsEntry found with id $id')),
    orElse: () => null,
  );
}

@Riverpod()
class NewsEntriesViewModel extends _$NewsEntriesViewModel {
  int _limit = 4;
  int _page = 0;

  @override
  Future<List<NewsEntry>> build({int? limit, int? page}) {
    _limit = limit ?? _limit;
    _page = page ?? _page;
    return _fetchEntries(limit: _limit, page: _page);
  }

  Future<void> loadNextPage() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      _page++;
      return await _fetchEntries(limit: _limit, page: _page);
    });
  }

  Future<void> loadPreviousPage() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      if (_page > 0) _page--;
      return _fetchEntries(limit: _limit, page: _page);
    });
  }

  Future<List<NewsEntry>> _fetchEntries({
    required int limit,
    required int page,
  }) async {
    var query = _newsEntriesCollection.reference.orderBy('createdAt', descending: false).limit(limit);

    // Si es la página 0, no se usa paginación
    if (page > 0) {
      final snapshot = await _newsEntriesCollection.reference
          .orderBy('createdAt', descending: false)
          .limit(limit * page) // Obtener hasta la página deseada
          .get();

      if (snapshot.docs.isNotEmpty) {
        query = query.startAfterDocument(snapshot.docs.last);
      }
    }

    final querySnapshot = await query.get();
    final entries = await Future.wait(
      querySnapshot.docs.map((doc) async => doc.data().toEntity()).toList(),
    );

    //_hasNextPage = !(entries.length < limit);

    return entries;
  }

  Future<void> deleteEntry(String id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _newsEntriesCollection.reference.doc(id).delete();
      return _fetchEntries(limit: _limit, page: _page);
    });
  }

  Future<void> updateEntry(NewsEntry entry) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _newsEntriesCollection.doc(entry.id).set(entry.toDto());
      return await _fetchEntries(limit: _limit, page: _page);
    });
  }

  Future<void> createEntry(NewsEntry entry) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _newsEntriesCollection.add(entry.toDto());
      return _fetchEntries(limit: _limit, page: _page);
    });
  }
}
