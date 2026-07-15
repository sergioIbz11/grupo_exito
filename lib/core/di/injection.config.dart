// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive_flutter/hive_flutter.dart' as _i986;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/cart/data/datasources/cart_datasource.dart' as _i589;
import '../../features/cart/data/datasources/cart_datasource_impl.dart'
    as _i1002;
import '../../features/cart/data/datasources/cart_hive_module.dart' as _i311;
import '../../features/cart/data/repositories/cart_repository_impl.dart'
    as _i642;
import '../../features/cart/domain/repositories/cart_repository.dart' as _i322;
import '../../features/cart/domain/usecases/add_item_to_cart_usecase.dart'
    as _i578;
import '../../features/cart/domain/usecases/clear_cart_usecase.dart' as _i240;
import '../../features/cart/domain/usecases/get_cart_item_list_usecase.dart'
    as _i782;
import '../../features/cart/domain/usecases/get_cart_item_usecase.dart'
    as _i359;
import '../../features/cart/domain/usecases/remove_item_from_cart_usecase.dart'
    as _i596;
import '../../features/categories/data/datasources/categories_datasource.dart'
    as _i102;
import '../../features/categories/data/datasources/categories_datasource_impl.dart'
    as _i827;
import '../../features/categories/data/repositories/products_repository_impl.dart'
    as _i476;
import '../../features/categories/domain/repositories/products_repository.dart'
    as _i51;
import '../../features/categories/domain/usecases/get_products_usecase.dart'
    as _i122;
import '../../features/products/data/datasources/products_datasource.dart'
    as _i1060;
import '../../features/products/data/datasources/products_datasource_impl.dart'
    as _i649;
import '../../features/products/data/repositories/products_repository_impl.dart'
    as _i1045;
import '../../features/products/domain/repositories/products_repository.dart'
    as _i27;
import '../../features/products/domain/usecases/get_products_by_id_usecase.dart'
    as _i31;
import '../network/dio_module.dart' as _i614;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    final cartHiveModule = _$CartHiveModule();
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio);
    gh.lazySingleton<_i102.CategoriesDatasource>(
      () => _i827.CategoriesDatasourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i1060.ProductsDatasource>(
      () => _i649.ProductsDatasourceImpl(gh<_i361.Dio>()),
    );
    await gh.factoryAsync<_i986.Box<int>>(
      () => cartHiveModule.cartBox,
      instanceName: 'cart_box',
      preResolve: true,
    );
    gh.lazySingleton<_i51.CategoriesRepository>(
      () => _i476.CategoriesRepositoryImpl(gh<_i102.CategoriesDatasource>()),
    );
    gh.factory<_i122.GetCategoriesUsecase>(
      () => _i122.GetCategoriesUsecase(gh<_i51.CategoriesRepository>()),
    );
    gh.lazySingleton<_i27.ProductsRepository>(
      () => _i1045.ProductsRepositoryImpl(gh<_i1060.ProductsDatasource>()),
    );
    gh.factory<_i31.GetProductsByIdUsecase>(
      () => _i31.GetProductsByIdUsecase(gh<_i27.ProductsRepository>()),
    );
    gh.lazySingleton<_i589.CartDatasource>(
      () => _i1002.CartDatasourceImpl(
        gh<_i986.Box<int>>(instanceName: 'cart_box'),
      ),
    );
    gh.lazySingleton<_i322.CartRepository>(
      () => _i642.CartRepositoryImpl(gh<_i589.CartDatasource>()),
    );
    gh.factory<_i578.AddItemToCartUsecase>(
      () => _i578.AddItemToCartUsecase(gh<_i322.CartRepository>()),
    );
    gh.factory<_i240.ClearCartUsecase>(
      () => _i240.ClearCartUsecase(gh<_i322.CartRepository>()),
    );
    gh.factory<_i782.GetCartItemListUsecase>(
      () => _i782.GetCartItemListUsecase(gh<_i322.CartRepository>()),
    );
    gh.factory<_i359.GetCartItemUsecase>(
      () => _i359.GetCartItemUsecase(gh<_i322.CartRepository>()),
    );
    gh.factory<_i596.RemoveItemFromCartUsecase>(
      () => _i596.RemoveItemFromCartUsecase(gh<_i322.CartRepository>()),
    );
    return this;
  }
}

class _$DioModule extends _i614.DioModule {}

class _$CartHiveModule extends _i311.CartHiveModule {}
