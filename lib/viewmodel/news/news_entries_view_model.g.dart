// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_entries_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(selectedNewsEntryById)
const selectedNewsEntryByIdProvider = SelectedNewsEntryByIdFamily._();

final class SelectedNewsEntryByIdProvider
    extends $FunctionalProvider<NewsEntry?, NewsEntry?, NewsEntry?>
    with $Provider<NewsEntry?> {
  const SelectedNewsEntryByIdProvider._({
    required SelectedNewsEntryByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'selectedNewsEntryByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$selectedNewsEntryByIdHash();

  @override
  String toString() {
    return r'selectedNewsEntryByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<NewsEntry?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NewsEntry? create(Ref ref) {
    final argument = this.argument as String;
    return selectedNewsEntryById(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NewsEntry? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NewsEntry?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SelectedNewsEntryByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$selectedNewsEntryByIdHash() =>
    r'ae6898c4a9024525ea74fdbfdb99ebb35344353b';

final class SelectedNewsEntryByIdFamily extends $Family
    with $FunctionalFamilyOverride<NewsEntry?, String> {
  const SelectedNewsEntryByIdFamily._()
    : super(
        retry: null,
        name: r'selectedNewsEntryByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SelectedNewsEntryByIdProvider call(String id) =>
      SelectedNewsEntryByIdProvider._(argument: id, from: this);

  @override
  String toString() => r'selectedNewsEntryByIdProvider';
}

@ProviderFor(NewsEntriesViewModel)
const newsEntriesViewModelProvider = NewsEntriesViewModelFamily._();

final class NewsEntriesViewModelProvider
    extends $AsyncNotifierProvider<NewsEntriesViewModel, List<NewsEntry>> {
  const NewsEntriesViewModelProvider._({
    required NewsEntriesViewModelFamily super.from,
    required ({int? limit, int? page}) super.argument,
  }) : super(
         retry: null,
         name: r'newsEntriesViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$newsEntriesViewModelHash();

  @override
  String toString() {
    return r'newsEntriesViewModelProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  NewsEntriesViewModel create() => NewsEntriesViewModel();

  @override
  bool operator ==(Object other) {
    return other is NewsEntriesViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$newsEntriesViewModelHash() =>
    r'1371ebdd15d541fcb81481f26e63f468eee73284';

final class NewsEntriesViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          NewsEntriesViewModel,
          AsyncValue<List<NewsEntry>>,
          List<NewsEntry>,
          FutureOr<List<NewsEntry>>,
          ({int? limit, int? page})
        > {
  const NewsEntriesViewModelFamily._()
    : super(
        retry: null,
        name: r'newsEntriesViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  NewsEntriesViewModelProvider call({int? limit, int? page}) =>
      NewsEntriesViewModelProvider._(
        argument: (limit: limit, page: page),
        from: this,
      );

  @override
  String toString() => r'newsEntriesViewModelProvider';
}

abstract class _$NewsEntriesViewModel extends $AsyncNotifier<List<NewsEntry>> {
  late final _$args = ref.$arg as ({int? limit, int? page});
  int? get limit => _$args.limit;
  int? get page => _$args.page;

  FutureOr<List<NewsEntry>> build({int? limit, int? page});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(limit: _$args.limit, page: _$args.page);
    final ref = this.ref as $Ref<AsyncValue<List<NewsEntry>>, List<NewsEntry>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<NewsEntry>>, List<NewsEntry>>,
              AsyncValue<List<NewsEntry>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
