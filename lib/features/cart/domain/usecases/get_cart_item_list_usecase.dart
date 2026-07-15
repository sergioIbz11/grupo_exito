import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/custom_error.dart';
import '../entities/cart_item_entity.dart';
import '../repositories/cart_repository.dart';

@injectable
class GetCartItemListUsecase {
  final CartRepository repository;
  GetCartItemListUsecase(this.repository);

  Future<Either<CustomError, List<CartItemEntity>>> call() async {
    return await repository.getCartItemList();
  }
}
