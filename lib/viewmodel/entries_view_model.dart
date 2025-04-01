import 'package:javier_website/core/blog_mappers.dart';
import 'package:javier_website/data/firestore_client.dart';
import 'package:javier_website/model/entry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'entries_view_model.g.dart';

final EntriesCollectionReference _entriesCollection =
    EntriesCollectionReference();

class EntriesViewModelArgs {
  final int limit;
  final int page;

  EntriesViewModelArgs({required this.limit, required this.page});
}

@Riverpod(keepAlive: true)
class EntriesViewModel extends _$EntriesViewModel {
  @override
  Future<List<Entry>> build({int limit = 4, int page = 0}) {
    return _fetchEntries(limit: limit, page: page);
  }

  Future<List<Entry>> _fetchEntries({
    required int limit,
    required int page,
  }) async {
    var query = _entriesCollection.reference
        .orderBy('createdAt', descending: false)
        .limit(limit);

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
      querySnapshot.docs
          .map((doc) async => await doc.data().toEntity())
          .toList(),
    );

    return entries;
  }
}
