// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(firebase)
final firebaseProvider = FirebaseProvider._();

final class FirebaseProvider
    extends $FunctionalProvider<FirebaseApp, FirebaseApp, FirebaseApp>
    with $Provider<FirebaseApp> {
  FirebaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'firebaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$firebaseHash();

  @$internal
  @override
  $ProviderElement<FirebaseApp> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FirebaseApp create(Ref ref) {
    return firebase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FirebaseApp value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FirebaseApp>(value),
    );
  }
}

String _$firebaseHash() => r'd63cdb5bc19ef62ddecaa56a69b39c60f84404e9';
