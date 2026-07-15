import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/category_entity.dart';
import '../mapper/category_model_to_entity.dart';
import '../models/category_model.dart';
import 'categories_datasource.dart';

@LazySingleton(as: CategoriesDatasource)
class CategoriesDatasourceImpl extends CategoriesDatasource {
  final Dio dio;

  CategoriesDatasourceImpl(this.dio);

  @override
  Future<List<CategoryEntity>> getCategoires() async {
    final Response<dynamic> response = await dio.get('categories');
    final List<dynamic> data = response.data as List<dynamic>;
    return data
        .map(
          (json) =>
              CategoryModel.fromJson(json as Map<String, dynamic>).toEntity(),
        )
        .toList();
  }
}
