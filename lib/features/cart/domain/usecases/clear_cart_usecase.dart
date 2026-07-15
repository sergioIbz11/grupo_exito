import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/custom_error.dart';
import '../repositories/cart_repository.dart';

@injectable
class ClearCartUsecase {
  final CartRepository repository;
  ClearCartUsecase(this.repository);

  Future<Either<CustomError, Unit>> call() async {
    return await repository.clearCart();
  }
}
