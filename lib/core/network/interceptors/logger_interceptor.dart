import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class LoggerInterceptor extends Interceptor {
  const LoggerInterceptor();

  static const String _reset = '\x1B[0m';
  static const String _green = '\x1B[32m';
  static const String _cyan = '\x1B[36m';
  static const String _red = '\x1B[31m';
  static const String _bold = '\x1B[1m';

  static const int _width = 80;

  void _printBox(String title, String content, String color) {
    final border = '═' * (_width - 2);

    final buffer = StringBuffer()
      ..writeln('\n$color╔$border╗')
      ..writeln('║ $_bold${title.padRight(_width - 4)}$_reset$color ║')
      ..writeln('╠$border╣');

    final lines = content.split('\n');
    for (var line in lines) {
      while (line.length > _width - 4) {
        final segment = line.substring(0, _width - 4);
        buffer.writeln('║ ${segment.padRight(_width - 4)} ║');
        line = line.substring(_width - 4);
      }
      buffer.writeln('║ ${line.padRight(_width - 4)} ║');
    }

    buffer.writeln('╚$border╝$_reset');
    debugPrint(buffer.toString());
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final content = StringBuffer()
      ..writeln('Method:   ${options.method}')
      ..writeln('URI:      ${options.uri}')
      ..writeln('Timeout:  ${options.connectTimeout ?? 'default'}ms')
      ..writeln('Headers:');

    options.headers.forEach((key, value) {
      content.writeln('  $key: $value');
    });

    if (options.data != null) {
      content.writeln('\nBody Data:');
      content.write(_prettyJson(options.data));
    }

    _printBox('🚀 REQUEST SENT', content.toString(), _green);
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final content = StringBuffer()
      ..writeln(
        'Status:   ${response.statusCode} ${response.statusMessage ?? ''}',
      )
      ..writeln('URI:      ${response.requestOptions.uri}')
      ..writeln('\nResponse Data:');

    content.write(_prettyJson(response.data));

    _printBox('✅ RESPONSE RECEIVED', content.toString(), _cyan);
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final content = StringBuffer()
      ..writeln('Error Type:   ${err.type}')
      ..writeln('Message:      ${err.message}')
      ..writeln('URI:          ${err.requestOptions.uri}')
      ..writeln('Status Code:  ${err.response?.statusCode ?? 'N/A'}');

    if (err.response?.data != null) {
      content.writeln('\nError Response Data:');
      content.write(_prettyJson(err.response?.data));
    }

    _printBox('🚨 NETWORK ERROR', content.toString(), _red);
    handler.next(err);
  }

  String _prettyJson(Object? data) {
    if (data == null) return 'null';

    try {
      const encoder = JsonEncoder.withIndent('  ');

      if (data is Map || data is List) {
        return encoder.convert(data);
      }

      if (data is String) {
        final decoded = jsonDecode(data);
        return encoder.convert(decoded);
      }

      return data.toString();
    } catch (_) {
      return data.toString();
    }
  }
}
