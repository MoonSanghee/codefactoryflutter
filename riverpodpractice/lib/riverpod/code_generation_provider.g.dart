// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_generation_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gStateHash() => r'7ccdacb016fab2894413745b936f82987f9f72cf';

/// See also [gState].
@ProviderFor(gState)
final gStateProvider = AutoDisposeProvider<String>.internal(
  gState,
  name: r'gStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$gStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GStateRef = AutoDisposeProviderRef<String>;
String _$gStateFutureHash() => r'eef3e95f799e15b4647a3851f8ee6b4438b05afa';

/// See also [gStateFuture].
@ProviderFor(gStateFuture)
final gStateFutureProvider = AutoDisposeFutureProvider<int>.internal(
  gStateFuture,
  name: r'gStateFutureProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$gStateFutureHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GStateFutureRef = AutoDisposeFutureProviderRef<int>;
String _$gStateFuture2Hash() => r'c346965a30436f2ab0f038c27592f51d26b2d4bb';

/// See also [gStateFuture2].
@ProviderFor(gStateFuture2)
final gStateFuture2Provider = FutureProvider<int>.internal(
  gStateFuture2,
  name: r'gStateFuture2Provider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gStateFuture2Hash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GStateFuture2Ref = FutureProviderRef<int>;
String _$gStateMultiplyHash() => r'ec5a8efb6ba3e90e29f7a0722867976890c2a634';

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

typedef GStateMultiplyRef = AutoDisposeProviderRef<int>;

/// See also [gStateMultiply].
@ProviderFor(gStateMultiply)
const gStateMultiplyProvider = GStateMultiplyFamily();

/// See also [gStateMultiply].
class GStateMultiplyFamily extends Family<int> {
  /// See also [gStateMultiply].
  const GStateMultiplyFamily();

  /// See also [gStateMultiply].
  GStateMultiplyProvider call({
    required int number1,
    required int number2,
  }) {
    return GStateMultiplyProvider(
      number1: number1,
      number2: number2,
    );
  }

  @override
  GStateMultiplyProvider getProviderOverride(
    covariant GStateMultiplyProvider provider,
  ) {
    return call(
      number1: provider.number1,
      number2: provider.number2,
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
  String? get name => r'gStateMultiplyProvider';
}

/// See also [gStateMultiply].
class GStateMultiplyProvider extends AutoDisposeProvider<int> {
  /// See also [gStateMultiply].
  GStateMultiplyProvider({
    required this.number1,
    required this.number2,
  }) : super.internal(
          (ref) => gStateMultiply(
            ref,
            number1: number1,
            number2: number2,
          ),
          from: gStateMultiplyProvider,
          name: r'gStateMultiplyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$gStateMultiplyHash,
          dependencies: GStateMultiplyFamily._dependencies,
          allTransitiveDependencies:
              GStateMultiplyFamily._allTransitiveDependencies,
        );

  final int number1;
  final int number2;

  @override
  bool operator ==(Object other) {
    return other is GStateMultiplyProvider &&
        other.number1 == number1 &&
        other.number2 == number2;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, number1.hashCode);
    hash = _SystemHash.combine(hash, number2.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
