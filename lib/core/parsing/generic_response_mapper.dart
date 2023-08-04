import 'package:network_layer_2/core/network/model/network_error.dart';
import 'package:network_layer_2/core/network/model/result.dart';
import 'package:network_layer_2/core/network/model/response_model.dart';
import 'package:network_layer_2/core/parsing/json_decoder.dart';
import 'package:network_layer_2/core/parsing/mapper_error.dart';

/// Use this class when API doesn't return a custom error model
final class GenericResponseMapper {
  static Result<R, MapperError> map<R, T>(
    ResponseModel? response,
    NetworkError? networkError,
    T Function(Map<String, dynamic> json) fromJson,
  ) {
    if (networkError != null) {
      return Failure(MapperError(networkError: networkError));
    }
    if (response == null) {
      return Failure(MapperError(networkError: NetworkError.badResponse()));
    }

    if (response.statusCode == 200) {
      final data = JSONDecoder().decode<R, T>(response.data, fromJson);
      return _handleData(data);
    }

    if (response.statusCode == 401) {
      return Failure(MapperError(networkError: NetworkError.tokenExpired()));
    }

    return Failure(MapperError(networkError: NetworkError.unknown()));
  }

  static Result<R, MapperError> _handleData<R>(R? data) {
    if (data == null) {
      return Failure(MapperError(networkError: NetworkError.decodingError()));
    }

    return Success(data);
  }
}
