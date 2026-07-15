// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CartNotifier)
final cartProvider = CartNotifierProvider._();

final class CartNotifierProvider
    extends $AsyncNotifierProvider<CartNotifier, List<CartItemEntity>> {
  CartNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cartNotifierHash();

  @$internal
  @override
  CartNotifier create() => CartNotifier();
}

String _$cartNotifierHash() => r'750093486aa622d1aab03b55804222af9aa8064a';

abstract class _$CartNotifier extends $AsyncNotifier<List<CartItemEntity>> {
  FutureOr<List<CartItemEntity>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<CartItemEntity>>, List<CartItemEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<CartItemEntity>>,
                List<CartItemEntity>
              >,
              AsyncValue<List<CartItemEntity>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(cartItemQuantity)
final cartItemQuantityProvider = CartItemQuantityFamily._();

final class CartItemQuantityProvider extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  CartItemQuantityProvider._({
    required CartItemQuantityFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'cartItemQuantityProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$cartItemQuantityHash();

  @override
  String toString() {
    return r'cartItemQuantityProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    final argument = this.argument as int;
    return cartItemQuantity(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CartItemQuantityProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$cartItemQuantityHash() => r'8b1075e49b8e29020b611809e6210cb13a87f3af';

final class CartItemQuantityFamily extends $Family
    with $FunctionalFamilyOverride<int, int> {
  CartItemQuantityFamily._()
    : super(
        retry: null,
        name: r'cartItemQuantityProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CartItemQuantityProvider call(int id) =>
      CartItemQuantityProvider._(argument: id, from: this);

  @override
  String toString() => r'cartItemQuantityProvider';
}

@ProviderFor(cartTotalQuantity)
final cartTotalQuantityProvider = CartTotalQuantityProvider._();

final class CartTotalQuantityProvider extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  CartTotalQuantityProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartTotalQuantityProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cartTotalQuantityHash();

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    return cartTotalQuantity(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$cartTotalQuantityHash() => r'03c0bb7b23a604b26562a8fcea61fdda7b332e5e';
