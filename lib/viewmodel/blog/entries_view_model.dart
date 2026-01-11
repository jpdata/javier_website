import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:javier_website/core/analytics_service.dart';
import 'package:javier_website/core/mappers.dart';
import 'package:javier_website/data/firestore_client.dart';
import 'package:javier_website/model/entry.dart';
import 'package:javier_website/model/user.dart';
import 'package:javier_website/viewmodel/user/user_view_model.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'entries_view_model.g.dart';

final EntriesCollectionReference _entriesCollection = EntriesCollectionReference();

// @riverpod
// Entry? selectedEntryById(Ref ref, String id) {
//   final entriesAsync = ref.watch(entriesViewModelProvider());
//   return entriesAsync.maybeWhen(
//     data: (entries) =>
//         entries.firstWhere((e) => e.id == id, orElse: () => throw StateError('No NewsEntry found with id $id')),
//     orElse: () => null,
//   );
// }

final combinedUserEntriesProvider = Provider<({AsyncValue<User> user, AsyncValue<List<Entry>> entries})>((ref) {
  final user = ref.watch(currentUserProvider);
  final entries = ref.watch(entriesViewModelProvider());
  return (user: user, entries: entries);
});

@Riverpod()
class EntryViewModel extends _$EntryViewModel {
  bool _isDisposed = false;

  @override
  Future<Entry> build(String id) async {
    ref.onDispose(() {
      _isDisposed = true;
    });

    final snapshot = await _entriesCollection.reference.doc(id).get();
    return snapshot.data()!.toEntity();
  }

  Future<void> updateEntry(Entry entry) async {
    if (_isDisposed) return;

    state = const AsyncValue.loading();
    try {
      await _entriesCollection.doc(entry.id).set(entry.toDto());
      if (_isDisposed) return;
      state = AsyncValue.data(entry);
    } catch (err, st) {
      if (_isDisposed) return;
      state = AsyncValue.error(err, st);
    }
  }
}

@Riverpod()
class EntriesViewModel extends _$EntriesViewModel {
  int _limit = 10;
  int _page = 0;
  bool _hasNextPage = false;
  bool _isDisposed = false;

  bool get hasNextPage => _hasNextPage;
  bool get hasPreviousPage => _page > 0;
  int get currentPage => _page;

  @override
  Future<List<Entry>> build({int? limit, int? page}) {
    _limit = limit ?? _limit;
    _page = page ?? _page;

    ref.onDispose(() {
      _isDisposed = true;
    });

    return _fetchEntries(limit: _limit, page: _page);
  }

  Future<void> loadNextPage() async {
    if (_isDisposed) return;

    state = const AsyncValue.loading();
    try {
      _page++;
      final entries = await _fetchEntries(limit: _limit, page: _page);
      if (_isDisposed) return;
      state = AsyncValue.data(entries);
    } catch (err, st) {
      if (_isDisposed) return;
      state = AsyncValue.error(err, st);
    }
  }

  Future<void> loadPreviousPage() async {
    if (_isDisposed) return;

    state = const AsyncValue.loading();
    try {
      if (_page > 0) _page--;
      final entries = await _fetchEntries(limit: _limit, page: _page);
      if (_isDisposed) return;
      state = AsyncValue.data(entries);
    } catch (err, st) {
      if (_isDisposed) return;
      state = AsyncValue.error(err, st);
    }
  }

  Future<List<Entry>> _fetchEntries({required int limit, required int page}) async {
    // Fetch one extra element to know if there is another page available.
    var query = _entriesCollection.reference.orderBy('createdAt', descending: true).limit(limit + 1);

    // Si es la página 0, no se usa paginación
    if (page > 0) {
      final snapshot = await _entriesCollection.reference
          .orderBy('createdAt', descending: true)
          .limit(limit * page) // Obtener hasta la página deseada
          .get();

      if (snapshot.docs.isNotEmpty) {
        query = query.startAfterDocument(snapshot.docs.last);
      }
    }

    final querySnapshot = await query.get();
    final entries = await Future.wait(querySnapshot.docs.map((doc) async => await doc.data().toEntity()).toList());

    _hasNextPage = entries.length > limit;

    // If we fetched one extra entry, drop it before returning the page.
    return _hasNextPage ? entries.sublist(0, limit) : entries;
  }

  Future<void> deleteEntry(String id) async {
    if (_isDisposed) return;

    state = const AsyncValue.loading();
    try {
      await _entriesCollection.reference.doc(id).delete();
      if (_isDisposed) return;
      await AnalyticsService.logEntryDeleted(entryId: id, entryType: 'blog_entry');
      if (_isDisposed) return;
      final entries = await _fetchEntries(limit: _limit, page: _page);
      if (_isDisposed) return;
      state = AsyncValue.data(entries);
    } catch (err, st) {
      if (_isDisposed) return;
      state = AsyncValue.error(err, st);
    }
  }

  Future<void> updateEntry(Entry entry) async {
    if (_isDisposed) return;

    state = const AsyncValue.loading();
    try {
      await _entriesCollection.reference.doc(entry.id).set(entry.toDto());
      if (_isDisposed) return;
      final entries = await _fetchEntries(limit: _limit, page: _page);
      if (_isDisposed) return;
      state = AsyncValue.data(entries);
    } catch (err, st) {
      if (_isDisposed) return;
      state = AsyncValue.error(err, st);
    }
  }

  Future<Entry> createEntry(Entry entry) async {
    if (_isDisposed) return entry;

    state = const AsyncValue.loading();
    String id = '';
    try {
      var result = await _entriesCollection.add(entry.toDto());
      id = result.id;
      if (_isDisposed) return entry.copyWith(id: id);

      final newEntry = entry.copyWith(id: id);
      await AnalyticsService.logEntryCreated(entryId: id, entryType: 'blog_entry', wordCount: entry.content.length);
      if (_isDisposed) return newEntry;

      // Reset to first page and add the new entry at the top
      _page = 0;
      final currentEntries = state.value ?? [];
      final updatedEntries = [newEntry, ...currentEntries];
      _hasNextPage = updatedEntries.length > _limit;
      state = AsyncValue.data(updatedEntries);
      return newEntry;
    } catch (err, st) {
      if (_isDisposed) return entry.copyWith(id: id);
      state = AsyncValue.error(err, st);
      return entry.copyWith(id: id);
    }
  }

  Future<Entry?> getEntryById(String id) async {
    DocumentSnapshot<EntryDto>? snapshot;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      snapshot = await _entriesCollection.reference.doc(id).get();
      return Future.value(state.value);
    });
    if (snapshot?.exists ?? false) {
      final Entry entry = await snapshot!.data()!.toEntity();
      final String entryTitle = entry.title;
      await AnalyticsService.logEntryView(entryId: id, entryTitle: entryTitle, entryCategory: 'blog');
      return entry;
    } else {
      return null;
    }
  }
}
