import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/custom_error.dart';
import '../entities/product_entity.dart';
import '../repositories/products_repository.dart';

@injectable
class GetProductsByIdUsecase {
  final ProductsRepository repository;
  GetProductsByIdUsecase(this.repository);

  Future<Either<CustomError, List<ProductEntity>>> call({int id = 0}) async {
    return await repository.getProductsById(id: id);
  }
}
