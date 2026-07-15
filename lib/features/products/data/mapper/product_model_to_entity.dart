import '../models/product_model.dart';
import '../../domain/entities/product_entity.dart';


extension ProductModelToEntity on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      title: title,
      slug: slug,
      price: price,
      description: description,

      images: images,
      creationAt: creationAt,
      updatedAt: updatedAt,
    );
  }
}
