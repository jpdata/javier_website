// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entries_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$entryViewModelHash() => r'f2aab6840b89a90dd04ae7954469ac7e2d4315aa';

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

abstract class _$EntryViewModel
    extends BuildlessAutoDisposeAsyncNotifier<Entry> {
  late final String id;

  FutureOr<Entry> build(
    String id,
  );
}

/// See also [EntryViewModel].
@ProviderFor(EntryViewModel)
const entryViewModelProvider = EntryViewModelFamily();

/// See also [EntryViewModel].
class EntryViewModelFamily extends Family<AsyncValue<Entry>> {
  /// See also [EntryViewModel].
  const EntryViewModelFamily();

  /// See also [EntryViewModel].
  EntryViewModelProvider call(
    String id,
  ) {
    return EntryViewModelProvider(
      id,
    );
  }

  @override
  EntryViewModelProvider getProviderOverride(
    covariant EntryViewModelProvider provider,
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
  String? get name => r'entryViewModelProvider';
}

/// See also [EntryViewModel].
class EntryViewModelProvider
    extends AutoDisposeAsyncNotifierProviderImpl<EntryViewModel, Entry> {
  /// See also [EntryViewModel].
  EntryViewModelProvider(
    String id,
  ) : this._internal(
          () => EntryViewModel()..id = id,
          from: entryViewModelProvider,
          name: r'entryViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$entryViewModelHash,
          dependencies: EntryViewModelFamily._dependencies,
          allTransitiveDependencies:
              EntryViewModelFamily._allTransitiveDependencies,
          id: id,
        );

  EntryViewModelProvider._internal(
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
  FutureOr<Entry> runNotifierBuild(
    covariant EntryViewModel notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(EntryViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: EntryViewModelProvider._internal(
        () => create()..id = id,
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
  AutoDisposeAsyncNotifierProviderElement<EntryViewModel, Entry>
      createElement() {
    return _EntryViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EntryViewModelProvider && other.id == id;
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
mixin EntryViewModelRef on AutoDisposeAsyncNotifierProviderRef<Entry> {
  /// The parameter `id` of this provider.
  String get id;
}

class _EntryViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<EntryViewModel, Entry>
    with EntryViewModelRef {
  _EntryViewModelProviderElement(super.provider);

  @override
  String get id => (origin as EntryViewModelProvider).id;
}

String _$entriesViewModelHash() => r'4a2faf756bfd4afc7f1cbc155c2ba8e1d049a806';

abstract class _$EntriesViewModel
    extends BuildlessAutoDisposeAsyncNotifier<List<Entry>> {
  late final int? limit;
  late final int? page;

  FutureOr<List<Entry>> build({
    int? limit,
    int? page,
  });
}

/// See also [EntriesViewModel].
@ProviderFor(EntriesViewModel)
const entriesViewModelProvider = EntriesViewModelFamily();

/// See also [EntriesViewModel].
class EntriesViewModelFamily extends Family<AsyncValue<List<Entry>>> {
  /// See also [EntriesViewModel].
  const EntriesViewModelFamily();

  /// See also [EntriesViewModel].
  EntriesViewModelProvider call({
    int? limit,
    int? page,
  }) {
    return EntriesViewModelProvider(
      limit: limit,
      page: page,
    );
  }

  @override
  EntriesViewModelProvider getProviderOverride(
    covariant EntriesViewModelProvider provider,
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
  String? get name => r'entriesViewModelProvider';
}

/// See also [EntriesViewModel].
class EntriesViewModelProvider extends AutoDisposeAsyncNotifierProviderImpl<
    EntriesViewModel, List<Entry>> {
  /// See also [EntriesViewModel].
  EntriesViewModelProvider({
    int? limit,
    int? page,
  }) : this._internal(
          () => EntriesViewModel()
            ..limit = limit
            ..page = page,
          from: entriesViewModelProvider,
          name: r'entriesViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$entriesViewModelHash,
          dependencies: EntriesViewModelFamily._dependencies,
          allTransitiveDependencies:
              EntriesViewModelFamily._allTransitiveDependencies,
          limit: limit,
          page: page,
        );

  EntriesViewModelProvider._internal(
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
  FutureOr<List<Entry>> runNotifierBuild(
    covariant EntriesViewModel notifier,
  ) {
    return notifier.build(
      limit: limit,
      page: page,
    );
  }

  @override
  Override overrideWith(EntriesViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: EntriesViewModelProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<EntriesViewModel, List<Entry>>
      createElement() {
    return _EntriesViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EntriesViewModelProvider &&
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
mixin EntriesViewModelRef on AutoDisposeAsyncNotifierProviderRef<List<Entry>> {
  /// The parameter `limit` of this provider.
  int? get limit;

  /// The parameter `page` of this provider.
  int? get page;
}

class _EntriesViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<EntriesViewModel,
        List<Entry>> with EntriesViewModelRef {
  _EntriesViewModelProviderElement(super.provider);

  @override
  int? get limit => (origin as EntriesViewModelProvider).limit;
  @override
  int? get page => (origin as EntriesViewModelProvider).page;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
