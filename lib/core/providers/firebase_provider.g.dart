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
    extends
        $FunctionalProvider<
          AsyncValue<FirebaseApp?>,
          FirebaseApp?,
          FutureOr<FirebaseApp?>
        >
    with $FutureModifier<FirebaseApp?>, $FutureProvider<FirebaseApp?> {
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
  $FutureProviderElement<FirebaseApp?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<FirebaseApp?> create(Ref ref) {
    return firebase(ref);
  }
}

String _$firebaseHash() => r'2803a697b9104556f7dfb6ff78e495bd3577746e';
