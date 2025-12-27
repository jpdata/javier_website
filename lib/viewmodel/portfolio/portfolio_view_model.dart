import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:javier_website/model/portfolio_entry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'portfolio_view_model.g.dart';

@riverpod
class PortfolioViewModel extends _$PortfolioViewModel {
  late FirebaseFirestore _firestore;

  @override
  Future<List<PortfolioEntry>> build() {
    _firestore = FirebaseFirestore.instance;
    return _fetchPortfolioEntries();
  }

  Future<List<PortfolioEntry>> _fetchPortfolioEntries() async {
    try {
      final snapshot = await _firestore
          .collection('portfolio')
          .orderBy('createdAt', descending: false)
          .get();

      return snapshot.docs.map((doc) {
        return PortfolioEntry.fromJson({
          'id': doc.id,
          ...doc.data(),
        });
      }).toList();
    } catch (e) {
      throw Exception('Error fetching portfolio entries: $e');
    }
  }

  Future<void> addEntry(PortfolioEntry entry) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _firestore.collection('portfolio').doc(entry.id).set(
            entry.toJson(),
          );
      return _fetchPortfolioEntries();
    });
  }

  Future<void> updateEntry(PortfolioEntry entry) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _firestore.collection('portfolio').doc(entry.id).update(
            entry.toJson(),
          );
      return _fetchPortfolioEntries();
    });
  }

  Future<void> deleteEntry(String id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _firestore.collection('portfolio').doc(id).delete();
      return _fetchPortfolioEntries();
    });
  }
}
