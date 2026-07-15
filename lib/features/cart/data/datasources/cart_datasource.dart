import '../../domain/entities/cart_item_entity.dart';

abstract class CartDatasource {
  Future<CartItemEntity> getCartItem({required int id});
  Future<List<CartItemEntity>> getCartItemList();
  Future<void> addItemToCart({
    required int id,
  });
  Future<void> removeItemFromCart({
    required int id,
  });
  Future<void> clearCart();
}
