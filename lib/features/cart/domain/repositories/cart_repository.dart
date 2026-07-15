import 'package:dartz/dartz.dart';

import '../../../../core/errors/custom_error.dart';
import '../entities/cart_item_entity.dart';

abstract interface class CartRepository {
  Future<Either<CustomError, CartItemEntity>> getCartItem({required int id});
  Future<Either<CustomError, List<CartItemEntity>>> getCartItemList();
  Future<Either<CustomError, Unit>> addItemToCart({
    required int id,
  });
  Future<Either<CustomError, Unit>> removeItemFromCart({
    required int id,
  });
  Future<Either<CustomError, Unit>> clearCart();
}
