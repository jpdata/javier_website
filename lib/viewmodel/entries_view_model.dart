import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:javier_website/core/blog_mappers.dart';
import 'package:javier_website/data/entry_dto.dart';
import 'package:javier_website/model/entry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'entries_view_model.g.dart';

final EntryDtoCollectionReference _entriesCollection =
    EntryDtoCollectionReference();

@Riverpod()
class EntriesViewModel extends _$EntriesViewModel {
  @override
  Future<List<Entry>> build() {
    return _fetchEntries();
  }

  Future<List<Entry>> _fetchEntries() async {
    final querySnapshot = await _entriesCollection.get();
    final entries =
        querySnapshot.docs.map((doc) => doc.data.toEntity()).toList();
    return entries;
  }
}
