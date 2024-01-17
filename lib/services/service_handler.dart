import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:picterest_app/helpers/snackbar_helper.dart';
import 'package:picterest_app/services/service_exceptions.dart';

dynamic handleResponse(Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = response;
      return responseJson;

    case 201:
      var responseJson = response.data;
      return responseJson;

    case 204:
      var responseJson = response.data;
      return responseJson;

    case 400:
      throw BadRequestException(
          'Received invalid status code: ${response.statusCode}',
          response.requestOptions.path);

    case 401:
      throw UnauthorizedException('Unauthorized request, please login first',
          response.requestOptions.path);

    default:
      throw FetchDataException(
          'Error occured with code: ${response.statusCode}',
          response.requestOptions.path);
  }
}

dynamic handleError(DioError response) {
  switch (response.type) {
    case DioErrorType.cancel:
      SnackbarHelper.showError(description: "${response.response?.statusCode}");
      throw FetchDataException(
          'Request to API server was cancelled', response.requestOptions.path);

    case DioErrorType.sendTimeout:
      throw ApiNotRespondingException(
          "Opps, it took longer in sending to server",
          response.requestOptions.path);

    case DioErrorType.connectTimeout:
      throw ApiNotRespondingException(
          "Opps, it took longer to respond with server",
          response.requestOptions.path);

    case DioErrorType.receiveTimeout:
      throw ApiNotRespondingException(
          "Opps, it took longer to respond with server",
          response.requestOptions.path);

    case DioErrorType.response:
      if (response.response?.statusCode == 400) {
        throw UnauthorizedException(
            response.response!.data['message'], response.requestOptions.path);
      } else if (response.response?.statusCode == 401) {
        throw UnauthorizedException('Unauthorized request, please login first',
            response.requestOptions.path);
      } else if (response.response?.statusCode == 500) {
        throw FetchDataException(
            response.response!.data['message'], response.requestOptions.path);
      } else {
        throw BadRequestException(
            response.response?.data['message'], response.requestOptions.path);
      }

    default:
      throw FetchDataException(
          'Tidak ada internet', response.requestOptions.path);
  }
}
