import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/custom_error.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/repositories/products_repository.dart';
import '../datasources/categories_datasource.dart';

@LazySingleton(as: CategoriesRepository)
class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesDatasource datasource;
  CategoriesRepositoryImpl(this.datasource);

  @override
  Future<Either<CustomError, List<CategoryEntity>>> getCategories() async {
    try {
      final result = await datasource.getCategoires();
      return Right(result);
    } on DioException catch (e) {
      return Left(CustomError(e.message ?? 'Error al cargar productos'));
    } catch (e) {
      return Left(CustomError('Error inesperado: $e'));
    }
  }
}
