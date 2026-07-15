import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/custom_error.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/products_repository.dart';
import '../datasources/products_datasource.dart';

@LazySingleton(as: ProductsRepository)
class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsDatasource datasource;
  ProductsRepositoryImpl(this.datasource);
  @override
  Future<Either<CustomError, List<ProductEntity>>> getProductsById({
    int id = 0,
  }) async {
    try {
      final result = await datasource.getProductsById(id: id);
      return Right(result);
    } on DioException catch (e) {
      return Left(CustomError(e.message ?? 'Error al cargar productos'));
    } catch (e) {
      return Left(CustomError('Error inesperado: $e'));
    }
  }
}
