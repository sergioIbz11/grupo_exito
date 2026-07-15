import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

import 'interceptors/logger_interceptor.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio get dio {
    final dio = Dio(
      BaseOptions(
        baseUrl: dotenv.env['BASE_URL']!,
      ),
    );
    if (kDebugMode) {
      dio.interceptors.add(const LoggerInterceptor());
    }
    return dio;
  }
}
