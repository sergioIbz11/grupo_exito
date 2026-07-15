import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/custom_error.dart';
import '../entities/cart_item_entity.dart';
import '../repositories/cart_repository.dart';

@injectable
class GetCartItemUsecase {
  final CartRepository repository;
  GetCartItemUsecase(this.repository);

  Future<Either<CustomError, CartItemEntity>> call({required int id}) async {
    return await repository.getCartItem(id: id);
  }
}
