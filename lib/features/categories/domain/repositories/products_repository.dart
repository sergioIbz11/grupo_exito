import 'package:dartz/dartz.dart';

import '../../../../core/errors/custom_error.dart';
import '../entities/category_entity.dart';

abstract interface class CategoriesRepository {
  Future<Either<CustomError, List<CategoryEntity>>> getCategories();
}
