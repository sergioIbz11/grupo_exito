import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/custom_error.dart';
import '../repositories/cart_repository.dart';

@injectable
class AddItemToCartUsecase {
  final CartRepository repository;
  AddItemToCartUsecase(this.repository);

  Future<Either<CustomError, Unit>> call({required int id}) async {
    return await repository.addItemToCart(id: id);
  }
}
