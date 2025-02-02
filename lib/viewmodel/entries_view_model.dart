import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:javier_website/core/blog_mappers.dart';
import 'package:javier_website/data/firestore_client.dart';
import 'package:javier_website/model/entry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'entries_view_model.g.dart';

final EntriesCollectionReference _entriesCollection =
    EntriesCollectionReference();

@Riverpod()
class EntriesViewModel extends _$EntriesViewModel {
  @override
  Future<List<Entry>> build() {
    return _fetchEntries();
  }

  Future<List<Entry>> _fetchEntries() async {
    final querySnapshot = await _entriesCollection.get();
    final entries = await Future.wait(
        querySnapshot.docs.map((doc) async => await doc.data.toEntity()).toList());
    return entries;
  }
}
