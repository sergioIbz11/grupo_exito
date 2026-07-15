import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/product_entity.dart';
import '../mapper/product_model_to_entity.dart';
import '../models/product_model.dart';
import 'products_datasource.dart';

@LazySingleton(as: ProductsDatasource)
class ProductsDatasourceImpl extends ProductsDatasource {
  final Dio dio;

  ProductsDatasourceImpl(this.dio);

  @override
  Future<List<ProductEntity>> getProductsById({int id=0}) async {
    final Response<dynamic> response = await dio.get('categories/$id/products');
    final List<dynamic> data = response.data as List<dynamic>;
    return data
        .map((json) => ProductModel.fromJson(json as Map<String, dynamic>).toEntity())
        .toList();
  }
}
