import 'package:dio/dio.dart';
import 'package:network_layer_2/core/network/model/network_error.dart';
import 'package:network_layer_2/core/network/model/response_model.dart';

extension DioExceptionExt on DioException {
  NetworkError toNetworkError() {
    return switch (type) {
      DioExceptionType.badCertificate => NetworkError.badCertificate(),
      DioExceptionType.badResponse => NetworkError.badResponse(),
      DioExceptionType.cancel => NetworkError.cancel(),
      DioExceptionType.connectionError => NetworkError.connectionError(),
      DioExceptionType.connectionTimeout => NetworkError.connectionTimeout(),
      DioExceptionType.receiveTimeout => NetworkError.receiveTimeout(),
      DioExceptionType.sendTimeout => NetworkError.sendTimeout(),
      DioExceptionType.unknown => NetworkError.unknown(),
    };
  }
}

extension DioResponseExt on Response? {
  ResponseModel toResponseModel() {
    return ResponseModel(
      data: this?.data,
      statusCode: this?.statusCode,
      statusMessage: this?.statusMessage,
    );
  }
}
