import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/custom_error.dart';
import '../../domain/entities/cart_item_entity.dart';
import '../mapper/cart_item_model_to_entity.dart';
import '../models/cart_item_model.dart';
import 'cart_datasource.dart';
import 'cart_hive_module.dart';

@LazySingleton(as: CartDatasource)
class CartDatasourceImpl extends CartDatasource {
  CartDatasourceImpl(@Named(cartBoxName) this._box);

  final Box<int> _box;

  @override
  Future<CartItemEntity> getCartItem({required int id}) async {
    final String key = id.toString();
    final int? units = _box.get(key);
    if (units == null) {
      throw CustomError('El producto $id no está en el carrito');
    }
    return CartItemModel(id: key, units: units).toEntity();
  }

  @override
  Future<List<CartItemEntity>> getCartItemList() async {
    return _box.keys
        .map(
          (dynamic key) =>
              CartItemModel(id: key as String, units: _box.get(key)).toEntity(),
        )
        .toList();
  }

  @override
  Future<void> addItemToCart({required int id}) async {
    final String key = id.toString();
    final int currentUnits = _box.get(key) ?? 0;
    await _box.put(key, currentUnits + 1);
  }

  @override
  Future<void> removeItemFromCart({required int id}) async {
    final String key = id.toString();
    final int updatedUnits = (_box.get(key) ?? 0) - 1;
    if (updatedUnits <= 0) {
      await _box.delete(key);
    } else {
      await _box.put(key, updatedUnits);
    }
  }

  @override
  Future<void> clearCart() async {
    await _box.clear();
  }
}
