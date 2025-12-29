// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PortfolioViewModel)
final portfolioViewModelProvider = PortfolioViewModelProvider._();

final class PortfolioViewModelProvider
    extends $AsyncNotifierProvider<PortfolioViewModel, List<PortfolioEntry>> {
  PortfolioViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'portfolioViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$portfolioViewModelHash();

  @$internal
  @override
  PortfolioViewModel create() => PortfolioViewModel();
}

String _$portfolioViewModelHash() =>
    r'0b2690c24149316abb1b4b0df63c9ce6eea4eee2';

abstract class _$PortfolioViewModel
    extends $AsyncNotifier<List<PortfolioEntry>> {
  FutureOr<List<PortfolioEntry>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<PortfolioEntry>>, List<PortfolioEntry>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<PortfolioEntry>>,
                List<PortfolioEntry>
              >,
              AsyncValue<List<PortfolioEntry>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
