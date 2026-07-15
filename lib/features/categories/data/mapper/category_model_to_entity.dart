import '../../domain/entities/category_entity.dart';
import '../models/category_model.dart';

extension CategoryModelToEntity on CategoryModel {
  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      name: name,
      slug: slug,
      image: image,
      creationAt: creationAt,
      updatedAt: updatedAt,
    );
  }
}
