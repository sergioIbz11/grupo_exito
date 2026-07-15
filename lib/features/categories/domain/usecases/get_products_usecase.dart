import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/custom_error.dart';
import '../entities/category_entity.dart';
import '../repositories/products_repository.dart';

@injectable
class GetCategoriesUsecase {
  final CategoriesRepository repository;
  GetCategoriesUsecase(this.repository);

  Future<Either<CustomError, List<CategoryEntity>>> call() async {
    return await repository.getCategories();
  }
}
