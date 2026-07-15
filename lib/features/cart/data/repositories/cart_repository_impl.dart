import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/custom_error.dart';
import '../../domain/entities/cart_item_entity.dart';
import '../../domain/repositories/cart_repository.dart';
import '../datasources/cart_datasource.dart';

@LazySingleton(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  CartRepositoryImpl(this._datasource);

  final CartDatasource _datasource;

  @override
  Future<Either<CustomError, CartItemEntity>> getCartItem({
    required int id,
  }) async {
    try {
      final CartItemEntity result = await _datasource.getCartItem(id: id);
      return Right(result);
    } catch (e) {
      return Left(CustomError('Error al obtener el producto del carrito: $e'));
    }
  }

  @override
  Future<Either<CustomError, List<CartItemEntity>>> getCartItemList() async {
    try {
      final List<CartItemEntity> result = await _datasource.getCartItemList();
      return Right(result);
    } catch (e) {
      return Left(CustomError('Error al obtener el carrito: $e'));
    }
  }

  @override
  Future<Either<CustomError, Unit>> addItemToCart({required int id}) async {
    try {
      await _datasource.addItemToCart(id: id);
      return const Right(unit);
    } catch (e) {
      return Left(CustomError('Error al agregar el producto al carrito: $e'));
    }
  }

  @override
  Future<Either<CustomError, Unit>> removeItemFromCart({
    required int id,
  }) async {
    try {
      await _datasource.removeItemFromCart(id: id);
      return const Right(unit);
    } catch (e) {
      return Left(CustomError('Error al quitar el producto del carrito: $e'));
    }
  }

  @override
  Future<Either<CustomError, Unit>> clearCart() async {
    try {
      await _datasource.clearCart();
      return const Right(unit);
    } catch (e) {
      return Left(CustomError('Error al vaciar el carrito: $e'));
    }
  }
}
