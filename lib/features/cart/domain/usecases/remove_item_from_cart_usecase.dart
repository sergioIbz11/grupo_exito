import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/custom_error.dart';
import '../repositories/cart_repository.dart';

@injectable
class RemoveItemFromCartUsecase {
  final CartRepository repository;
  RemoveItemFromCartUsecase(this.repository);

  Future<Either<CustomError, Unit>> call({required int id}) async {
    return await repository.removeItemFromCart(id: id);
  }
}
