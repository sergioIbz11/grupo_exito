import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/category_entity.dart';
import '../../domain/usecases/get_products_usecase.dart';

part 'categories_provider.g.dart';

@riverpod
class CategoriesNotifier extends _$CategoriesNotifier {
  late final GetCategoriesUsecase _getCategoriesUsecase;

  @override
  Future<List<CategoryEntity>> build() async {
    _getCategoriesUsecase = GetIt.I<GetCategoriesUsecase>();
    return _fetchCategories();
  }

  Future<List<CategoryEntity>> _fetchCategories() async {
    final result = await _getCategoriesUsecase.call();

    return result.fold(
      (customError) => throw customError.message,
      (categories) => categories,
    );
  }

  Future<void> reloadCategories() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchCategories());
  }
}
