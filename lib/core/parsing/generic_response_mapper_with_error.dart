import 'package:network_layer_2/core/network/model/network_error.dart';
import 'package:network_layer_2/core/network/model/result.dart';
import 'package:network_layer_2/core/network/model/response_model.dart';
import 'package:network_layer_2/core/parsing/json_decoder.dart';
import 'package:network_layer_2/core/parsing/mapper_error.dart';

/// Use this class when API returns a custom error model<br>
/// Such as -> {"error": "Not found", "detail": "Cannot find your profile information"}<br>
final class GenericResponseMapperWithError {
  static Result<R, MapperError<E>> map<R, T, E>(
    ResponseModel? response,
    NetworkError? networkError,
    T Function(Map<String, dynamic> json) fromJson,
    E Function(Map<String, dynamic> json) errorFromJson,
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

    // Some special situation here
    // When status code is 404, API returns a custom error model
    if (response.statusCode == 404) {
      final data = JSONDecoder().decode<E, E>(response.data, errorFromJson);
      return _handleError(data);
    }

    if (response.statusCode == 401) {
      return Failure(MapperError(networkError: NetworkError.tokenExpired()));
    }

    return Failure(MapperError(networkError: NetworkError.unknown()));
  }

  static Result<R, MapperError<E>> _handleData<R, E>(R? data) {
    if (data == null) {
      return Failure(MapperError(networkError: NetworkError.decodingError()));
    }

    return Success(data);
  }

  static Result<R, MapperError<E>> _handleError<R, E>(E? data) {
    if (data == null) {
      return Failure(MapperError(networkError: NetworkError.decodingError()));
    }

    return Failure(MapperError(
        networkError: NetworkError.badResponse(), errorModel: data));
  }
}
