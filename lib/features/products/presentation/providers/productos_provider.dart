import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/product_entity.dart';
import '../../domain/usecases/get_products_by_id_usecase.dart';

part 'productos_provider.g.dart';

@riverpod
class ProductsNotifier extends _$ProductsNotifier {
  late final GetProductsByIdUsecase _getProductsUsecase;

  @override
  Future<List<ProductEntity>> build(int id) async {
    _getProductsUsecase = GetIt.I<GetProductsByIdUsecase>();
    return _fetchProducts(id);
  }

  Future<List<ProductEntity>> _fetchProducts(int id) async {
    final result = await _getProductsUsecase.call(id: id);

    return result.fold(
      (customError) => throw customError.message,
      (products) => products,
    );
  }

  Future<void> reloadProducts() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchProducts(id));
  }
}
