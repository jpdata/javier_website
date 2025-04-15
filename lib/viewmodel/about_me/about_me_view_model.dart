import 'package:javier_website/core/blog_mappers.dart';
import 'package:javier_website/core/providers/notifiers/locale_notifier.dart';
import 'package:javier_website/data/firestore_client.dart';
import 'package:javier_website/model/about_me.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'about_me_view_model.g.dart';

final AboutMeCollectionReference _entriesCollection = AboutMeCollectionReference();

@Riverpod()
class AboutMeViewModel extends _$AboutMeViewModel {
  @override
  Future<AboutMe> build() async {
    final locale = ref.watch(localeNotifierProvider);
    var result = await _fetchAboutMe(locale.languageCode);
    return result;
  }

  Future<AboutMe> _fetchAboutMe(String locale) async {
    var snapshot = await _entriesCollection.whereLanguage(isEqualTo: locale).get();
    if (snapshot.snapshot.size == 0) {
      snapshot = await _entriesCollection.whereLanguage(isEqualTo: 'es').get();
    }
    return snapshot.docs.first.data.toEntity();
  }
}
