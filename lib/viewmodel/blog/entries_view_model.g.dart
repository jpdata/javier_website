// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entries_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EntryViewModel)
const entryViewModelProvider = EntryViewModelFamily._();

final class EntryViewModelProvider
    extends $AsyncNotifierProvider<EntryViewModel, Entry> {
  const EntryViewModelProvider._({
    required EntryViewModelFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'entryViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$entryViewModelHash();

  @override
  String toString() {
    return r'entryViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  EntryViewModel create() => EntryViewModel();

  @override
  bool operator ==(Object other) {
    return other is EntryViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$entryViewModelHash() => r'5cf6bc2cba375ced9dfe19699de1fc53addd6ce4';

final class EntryViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          EntryViewModel,
          AsyncValue<Entry>,
          Entry,
          FutureOr<Entry>,
          String
        > {
  const EntryViewModelFamily._()
    : super(
        retry: null,
        name: r'entryViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  EntryViewModelProvider call(String id) =>
      EntryViewModelProvider._(argument: id, from: this);

  @override
  String toString() => r'entryViewModelProvider';
}

abstract class _$EntryViewModel extends $AsyncNotifier<Entry> {
  late final _$args = ref.$arg as String;
  String get id => _$args;

  FutureOr<Entry> build(String id);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<Entry>, Entry>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Entry>, Entry>,
              AsyncValue<Entry>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(EntriesViewModel)
const entriesViewModelProvider = EntriesViewModelFamily._();

final class EntriesViewModelProvider
    extends $AsyncNotifierProvider<EntriesViewModel, List<Entry>> {
  const EntriesViewModelProvider._({
    required EntriesViewModelFamily super.from,
    required ({int? limit, int? page}) super.argument,
  }) : super(
         retry: null,
         name: r'entriesViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$entriesViewModelHash();

  @override
  String toString() {
    return r'entriesViewModelProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  EntriesViewModel create() => EntriesViewModel();

  @override
  bool operator ==(Object other) {
    return other is EntriesViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$entriesViewModelHash() => r'5e148629e80faf60995f282057d8ef8f87d4f83f';

final class EntriesViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          EntriesViewModel,
          AsyncValue<List<Entry>>,
          List<Entry>,
          FutureOr<List<Entry>>,
          ({int? limit, int? page})
        > {
  const EntriesViewModelFamily._()
    : super(
        retry: null,
        name: r'entriesViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  EntriesViewModelProvider call({int? limit, int? page}) =>
      EntriesViewModelProvider._(
        argument: (limit: limit, page: page),
        from: this,
      );

  @override
  String toString() => r'entriesViewModelProvider';
}

abstract class _$EntriesViewModel extends $AsyncNotifier<List<Entry>> {
  late final _$args = ref.$arg as ({int? limit, int? page});
  int? get limit => _$args.limit;
  int? get page => _$args.page;

  FutureOr<List<Entry>> build({int? limit, int? page});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(limit: _$args.limit, page: _$args.page);
    final ref = this.ref as $Ref<AsyncValue<List<Entry>>, List<Entry>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Entry>>, List<Entry>>,
              AsyncValue<List<Entry>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
