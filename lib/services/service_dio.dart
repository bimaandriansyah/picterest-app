// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:dio/dio.dart';

Future<Dio> apiCall([String? token]) async {
  var _dio = Dio();

  _dio
    ..options.baseUrl = 'https://picsum.photos/v2/'
    ..options.headers["Content-Type"] = "application/json"
    ..options.connectTimeout = 60 * 2000;

  if (token != null) {
    _dio.options.headers['authorization'] = 'Bearer $token';
  }

  return _dio;
}
