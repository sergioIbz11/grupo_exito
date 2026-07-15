import '../models/cart_item_model.dart';
import '../../domain/entities/cart_item_entity.dart';

extension CartItemModelToEntity on CartItemModel {
  CartItemEntity toEntity() {
    return CartItemEntity(
      id: id,
      units: units,
    );
  }
}
