// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response, FormData;
import 'package:path_provider/path_provider.dart';
import 'package:picterest_app/services/service_dio.dart';
import 'package:picterest_app/services/service_handler.dart';

class ServiceProvider {
  static Future<dynamic> getData(String path, {String? token}) async {
    try {
      Response response = await apiCall(token).then((value) => value.get(path));
      return handleResponse(response);
    } on DioError catch (e) {
      throw handleError(e);
    }
  }

  static Future<dynamic> postData(String path,
      {Map? data, String? token}) async {
    if (!Get.isSnackbarOpen) {
      try {
        Response response =
            await apiCall(token).then((value) => value.post(path, data: data));
        return handleResponse(response);
      } on DioError catch (e) {
        throw handleError(e);
      }
    }
  }

  static Future<dynamic> postDataFile(String path,
      {FormData? data,
      String? token,
      void Function(int, int)? onSendProgress}) async {
    if (!Get.isSnackbarOpen) {
      try {
        Response response = await apiCall(token).then((value) =>
            value.post(path, data: data, onSendProgress: onSendProgress));
        return handleResponse(response);
      } on DioError catch (e) {
        throw handleError(e);
      }
    }
  }

  static Future<dynamic> putData(String path,
      {Map? data, String? token}) async {
    try {
      Response response =
          await apiCall(token).then((value) => value.put(path, data: data));
      return handleResponse(response);
    } on DioError catch (e) {
      throw handleError(e);
    }
  }

  static Future<dynamic> putDataFile(String path,
      {FormData? data, String? token}) async {
    try {
      Response response =
          await apiCall(token).then((value) => value.put(path, data: data));
      return handleResponse(response);
    } on DioError catch (e) {
      throw handleError(e);
    }
  }

  static Future<dynamic> deleteData(String path,
      {Map? data, String? token}) async {
    try {
      Response response =
          await apiCall(token).then((value) => value.delete(path));
      return handleResponse(response);
    } on DioError catch (e) {
      throw handleError(e);
    }
  }

  static Future<String> getFilePath({String? uniqueFileName}) async {
    String path = '';
    Directory dir;

    if (Platform.isIOS) {
      dir = await getTemporaryDirectory();
    } else {
      dir = await getTemporaryDirectory();
    }

    path = '${dir.path}/${uniqueFileName!.split('/').last}';

    return path;
  }

  static Future<dynamic> downloadDataFile(String url,
      {void Function(int, int)? onReceiveProgress, String? token}) async {
    try {
      String savePath = await getFilePath(
          uniqueFileName:
              utf8.decode(base64.decode(url.split("/").last.toString())));
      Response response = await apiCall(token).then((value) => value.download(
          url, savePath,
          onReceiveProgress: onReceiveProgress, deleteOnError: true));
      return handleResponse(response);
    } on DioError catch (e) {
      throw handleError(e);
    }
  }
}
