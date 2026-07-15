// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productos_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProductsNotifier)
final productsProvider = ProductsNotifierFamily._();

final class ProductsNotifierProvider
    extends $AsyncNotifierProvider<ProductsNotifier, List<ProductEntity>> {
  ProductsNotifierProvider._({
    required ProductsNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'productsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$productsNotifierHash();

  @override
  String toString() {
    return r'productsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ProductsNotifier create() => ProductsNotifier();

  @override
  bool operator ==(Object other) {
    return other is ProductsNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$productsNotifierHash() => r'ebf1978d614807237e17ac8656453f5d7168f94a';

final class ProductsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          ProductsNotifier,
          AsyncValue<List<ProductEntity>>,
          List<ProductEntity>,
          FutureOr<List<ProductEntity>>,
          int
        > {
  ProductsNotifierFamily._()
    : super(
        retry: null,
        name: r'productsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProductsNotifierProvider call(int id) =>
      ProductsNotifierProvider._(argument: id, from: this);

  @override
  String toString() => r'productsProvider';
}

abstract class _$ProductsNotifier extends $AsyncNotifier<List<ProductEntity>> {
  late final _$args = ref.$arg as int;
  int get id => _$args;

  FutureOr<List<ProductEntity>> build(int id);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<ProductEntity>>, List<ProductEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<ProductEntity>>, List<ProductEntity>>,
              AsyncValue<List<ProductEntity>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
