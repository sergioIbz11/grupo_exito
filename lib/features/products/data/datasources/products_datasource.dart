import '../../domain/entities/product_entity.dart';

abstract class ProductsDatasource {
  Future<List<ProductEntity>> getProductsById({int id=0});
}