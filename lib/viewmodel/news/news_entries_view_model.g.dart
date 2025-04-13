// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_entries_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$selectedNewsEntryByIdHash() =>
    r'ae6898c4a9024525ea74fdbfdb99ebb35344353b';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [selectedNewsEntryById].
@ProviderFor(selectedNewsEntryById)
const selectedNewsEntryByIdProvider = SelectedNewsEntryByIdFamily();

/// See also [selectedNewsEntryById].
class SelectedNewsEntryByIdFamily extends Family<NewsEntry?> {
  /// See also [selectedNewsEntryById].
  const SelectedNewsEntryByIdFamily();

  /// See also [selectedNewsEntryById].
  SelectedNewsEntryByIdProvider call(
    String id,
  ) {
    return SelectedNewsEntryByIdProvider(
      id,
    );
  }

  @override
  SelectedNewsEntryByIdProvider getProviderOverride(
    covariant SelectedNewsEntryByIdProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'selectedNewsEntryByIdProvider';
}

/// See also [selectedNewsEntryById].
class SelectedNewsEntryByIdProvider extends AutoDisposeProvider<NewsEntry?> {
  /// See also [selectedNewsEntryById].
  SelectedNewsEntryByIdProvider(
    String id,
  ) : this._internal(
          (ref) => selectedNewsEntryById(
            ref as SelectedNewsEntryByIdRef,
            id,
          ),
          from: selectedNewsEntryByIdProvider,
          name: r'selectedNewsEntryByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$selectedNewsEntryByIdHash,
          dependencies: SelectedNewsEntryByIdFamily._dependencies,
          allTransitiveDependencies:
              SelectedNewsEntryByIdFamily._allTransitiveDependencies,
          id: id,
        );

  SelectedNewsEntryByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    NewsEntry? Function(SelectedNewsEntryByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SelectedNewsEntryByIdProvider._internal(
        (ref) => create(ref as SelectedNewsEntryByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<NewsEntry?> createElement() {
    return _SelectedNewsEntryByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SelectedNewsEntryByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SelectedNewsEntryByIdRef on AutoDisposeProviderRef<NewsEntry?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _SelectedNewsEntryByIdProviderElement
    extends AutoDisposeProviderElement<NewsEntry?>
    with SelectedNewsEntryByIdRef {
  _SelectedNewsEntryByIdProviderElement(super.provider);

  @override
  String get id => (origin as SelectedNewsEntryByIdProvider).id;
}

String _$newsEntriesViewModelHash() =>
    r'066bc87ea471478535c8a8f87dff0041871ab22e';

abstract class _$NewsEntriesViewModel
    extends BuildlessAutoDisposeAsyncNotifier<List<NewsEntry>> {
  late final int? limit;
  late final int? page;

  FutureOr<List<NewsEntry>> build({
    int? limit,
    int? page,
  });
}

/// See also [NewsEntriesViewModel].
@ProviderFor(NewsEntriesViewModel)
const newsEntriesViewModelProvider = NewsEntriesViewModelFamily();

/// See also [NewsEntriesViewModel].
class NewsEntriesViewModelFamily extends Family<AsyncValue<List<NewsEntry>>> {
  /// See also [NewsEntriesViewModel].
  const NewsEntriesViewModelFamily();

  /// See also [NewsEntriesViewModel].
  NewsEntriesViewModelProvider call({
    int? limit,
    int? page,
  }) {
    return NewsEntriesViewModelProvider(
      limit: limit,
      page: page,
    );
  }

  @override
  NewsEntriesViewModelProvider getProviderOverride(
    covariant NewsEntriesViewModelProvider provider,
  ) {
    return call(
      limit: provider.limit,
      page: provider.page,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'newsEntriesViewModelProvider';
}

/// See also [NewsEntriesViewModel].
class NewsEntriesViewModelProvider extends AutoDisposeAsyncNotifierProviderImpl<
    NewsEntriesViewModel, List<NewsEntry>> {
  /// See also [NewsEntriesViewModel].
  NewsEntriesViewModelProvider({
    int? limit,
    int? page,
  }) : this._internal(
          () => NewsEntriesViewModel()
            ..limit = limit
            ..page = page,
          from: newsEntriesViewModelProvider,
          name: r'newsEntriesViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$newsEntriesViewModelHash,
          dependencies: NewsEntriesViewModelFamily._dependencies,
          allTransitiveDependencies:
              NewsEntriesViewModelFamily._allTransitiveDependencies,
          limit: limit,
          page: page,
        );

  NewsEntriesViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.limit,
    required this.page,
  }) : super.internal();

  final int? limit;
  final int? page;

  @override
  FutureOr<List<NewsEntry>> runNotifierBuild(
    covariant NewsEntriesViewModel notifier,
  ) {
    return notifier.build(
      limit: limit,
      page: page,
    );
  }

  @override
  Override overrideWith(NewsEntriesViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: NewsEntriesViewModelProvider._internal(
        () => create()
          ..limit = limit
          ..page = page,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        limit: limit,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<NewsEntriesViewModel, List<NewsEntry>>
      createElement() {
    return _NewsEntriesViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NewsEntriesViewModelProvider &&
        other.limit == limit &&
        other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin NewsEntriesViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<List<NewsEntry>> {
  /// The parameter `limit` of this provider.
  int? get limit;

  /// The parameter `page` of this provider.
  int? get page;
}

class _NewsEntriesViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<NewsEntriesViewModel,
        List<NewsEntry>> with NewsEntriesViewModelRef {
  _NewsEntriesViewModelProviderElement(super.provider);

  @override
  int? get limit => (origin as NewsEntriesViewModelProvider).limit;
  @override
  int? get page => (origin as NewsEntriesViewModelProvider).page;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
