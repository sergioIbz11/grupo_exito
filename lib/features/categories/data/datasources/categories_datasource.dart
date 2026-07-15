import '../../domain/entities/category_entity.dart';

abstract class CategoriesDatasource {
  Future<List<CategoryEntity>> getCategoires();
}
