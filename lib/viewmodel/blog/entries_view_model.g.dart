// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entries_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EntryViewModel)
final entryViewModelProvider = EntryViewModelFamily._();

final class EntryViewModelProvider
    extends $AsyncNotifierProvider<EntryViewModel, Entry> {
  EntryViewModelProvider._({
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

String _$entryViewModelHash() => r'f2aab6840b89a90dd04ae7954469ac7e2d4315aa';

final class EntryViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          EntryViewModel,
          AsyncValue<Entry>,
          Entry,
          FutureOr<Entry>,
          String
        > {
  EntryViewModelFamily._()
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
    final ref = this.ref as $Ref<AsyncValue<Entry>, Entry>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Entry>, Entry>,
              AsyncValue<Entry>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(EntriesViewModel)
final entriesViewModelProvider = EntriesViewModelFamily._();

final class EntriesViewModelProvider
    extends $AsyncNotifierProvider<EntriesViewModel, List<Entry>> {
  EntriesViewModelProvider._({
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

String _$entriesViewModelHash() => r'60427e7533d8a82d9313a321193bdc4c47a4f043';

final class EntriesViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          EntriesViewModel,
          AsyncValue<List<Entry>>,
          List<Entry>,
          FutureOr<List<Entry>>,
          ({int? limit, int? page})
        > {
  EntriesViewModelFamily._()
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
    final ref = this.ref as $Ref<AsyncValue<List<Entry>>, List<Entry>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Entry>>, List<Entry>>,
              AsyncValue<List<Entry>>,
              Object?,
              Object?
            >;
    element.handleCreate(
      ref,
      () => build(limit: _$args.limit, page: _$args.page),
    );
  }
}
