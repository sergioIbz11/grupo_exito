import 'package:dartz/dartz.dart';

import '../../../../core/errors/custom_error.dart';
import '../entities/product_entity.dart';

abstract interface class ProductsRepository {
  Future<Either<CustomError, List<ProductEntity>>> getProductsById({
    int id = 0,
  });
}
