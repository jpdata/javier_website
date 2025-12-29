// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_me_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AboutMeViewModel)
final aboutMeViewModelProvider = AboutMeViewModelProvider._();

final class AboutMeViewModelProvider
    extends $AsyncNotifierProvider<AboutMeViewModel, AboutMe> {
  AboutMeViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aboutMeViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aboutMeViewModelHash();

  @$internal
  @override
  AboutMeViewModel create() => AboutMeViewModel();
}

String _$aboutMeViewModelHash() => r'a554dc38b7de2b89970d294c63c68a7738cb2564';

abstract class _$AboutMeViewModel extends $AsyncNotifier<AboutMe> {
  FutureOr<AboutMe> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<AboutMe>, AboutMe>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AboutMe>, AboutMe>,
              AsyncValue<AboutMe>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
