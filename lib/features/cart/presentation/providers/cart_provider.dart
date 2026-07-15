import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/cart_item_entity.dart';
import '../../domain/usecases/add_item_to_cart_usecase.dart';
import '../../domain/usecases/clear_cart_usecase.dart';
import '../../domain/usecases/get_cart_item_list_usecase.dart';
import '../../domain/usecases/remove_item_from_cart_usecase.dart';

part 'cart_provider.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
  late final GetCartItemListUsecase _getCartItemListUsecase;
  late final AddItemToCartUsecase _addItemToCartUsecase;
  late final RemoveItemFromCartUsecase _removeItemFromCartUsecase;
  late final ClearCartUsecase _clearCartUsecase;

  @override
  Future<List<CartItemEntity>> build() async {
    _getCartItemListUsecase = GetIt.I<GetCartItemListUsecase>();
    _addItemToCartUsecase = GetIt.I<AddItemToCartUsecase>();
    _removeItemFromCartUsecase = GetIt.I<RemoveItemFromCartUsecase>();
    _clearCartUsecase = GetIt.I<ClearCartUsecase>();
    return _fetchCartItems();
  }

  Future<List<CartItemEntity>> _fetchCartItems() async {
    final result = await _getCartItemListUsecase.call();

    return result.fold(
      (customError) => throw customError.message,
      (items) => items,
    );
  }


  Future<void> addItem(int id) async {
    final result = await _addItemToCartUsecase.call(id: id);

    result.fold((customError) => throw customError.message, (_) => null);

    state = await AsyncValue.guard(_fetchCartItems);
  }


  Future<void> removeItem(int id) async {
    final result = await _removeItemFromCartUsecase.call(id: id);

    result.fold((customError) => throw customError.message, (_) => null);

    state = await AsyncValue.guard(_fetchCartItems);
  }

  Future<void> clearCart() async {
    final result = await _clearCartUsecase.call();

    result.fold((customError) => throw customError.message, (_) => null);

    state = await AsyncValue.guard(_fetchCartItems);
  }

  Future<void> reloadCart() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(_fetchCartItems);
  }
}


@riverpod
int cartItemQuantity(Ref ref, int id) {
  final items = ref.watch(cartProvider).value ?? const <CartItemEntity>[];
  final key = id.toString();

  for (final item in items) {
    if (item.id == key) return item.units ?? 0;
  }
  return 0;
}

@riverpod
int cartTotalQuantity(Ref ref) {
  final items = ref.watch(cartProvider).value ?? const <CartItemEntity>[];
  return items.fold(0, (total, item) => total + (item.units ?? 0));
}
