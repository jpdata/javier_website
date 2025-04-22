import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:javier_website/core/mappers.dart';
import 'package:javier_website/data/firestore_client.dart';
import 'package:javier_website/model/entry.dart';
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

@Riverpod()
class EntryViewModel extends _$EntryViewModel {
  @override
  Future<Entry> build(String id) async {
    final snapshot = await _entriesCollection.reference.doc(id).get();
    return snapshot.data()!.toEntity();
  }

  Future<void> updateEntry(Entry entry) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _entriesCollection.doc(entry.id).set(entry.toDto());
      return entry;
    });
  }
}

@Riverpod()
class EntriesViewModel extends _$EntriesViewModel {
  int _limit = 4;
  int _page = 0;

  @override
  Future<List<Entry>> build({int? limit, int? page}) {
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

  Future<List<Entry>> _fetchEntries({
    required int limit,
    required int page,
  }) async {
    var query = _entriesCollection.reference.orderBy('createdAt', descending: false).limit(limit);

    // Si es la página 0, no se usa paginación
    if (page > 0) {
      final snapshot = await _entriesCollection.reference
          .orderBy('createdAt', descending: false)
          .limit(limit * page) // Obtener hasta la página deseada
          .get();

      if (snapshot.docs.isNotEmpty) {
        query = query.startAfterDocument(snapshot.docs.last);
      }
    }

    final querySnapshot = await query.get();
    final entries = await Future.wait(
      querySnapshot.docs.map((doc) async => await doc.data().toEntity()).toList(),
    );

    //_hasNextPage = !(entries.length < limit);

    return entries;
  }

  Future<void> deleteEntry(String id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _entriesCollection.reference.doc(id).delete();
      return _fetchEntries(limit: _limit, page: _page);
    });
  }

  Future<void> updateEntry(Entry entry) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _entriesCollection.reference.doc(entry.id).set(entry.toDto());
      return await _fetchEntries(limit: _limit, page: _page);
    });
  }

  Future<Entry> createEntry(Entry entry) async {
    state = const AsyncValue.loading();
    String id = '';
    state = await AsyncValue.guard(() async {
      var result = await _entriesCollection.add(entry.toDto());
      id = result.id;
      return _fetchEntries(limit: _limit, page: _page);
    });
    return entry.copyWith(id: id);
  }

  Future<Entry?> getEntryById(String id) async {
    DocumentSnapshot<EntryDto>? snapshot;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      snapshot = await _entriesCollection.reference.doc(id).get();
      return Future.value(state.value);
    });
    if (snapshot?.exists ?? false) {
      return snapshot!.data()!.toEntity();
    } else {
      return null;
    }
  }
}
