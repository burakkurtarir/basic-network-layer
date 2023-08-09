import 'package:network_layer_2/core/network/model/network_error.dart';
import 'package:network_layer_2/core/network/model/result.dart';
import 'package:network_layer_2/core/network/model/response_model.dart';
import 'package:network_layer_2/core/parsing/json_decoder.dart';

/// Use this class when API returns a custom error model<br>
/// Such as -> {"error": "Not found", "detail": "Cannot find your profile information"}<br>
final class GenericResponseMapperWithError {
  static Result<R, NetworkError<E>> map<R, T, E>(
    Result<ResponseModel, NetworkError> result,
    T Function(Map<String, dynamic> json) fromJson,
    E Function(Map<String, dynamic> json) errorFromJson,
  ) {
    switch (result) {
      case Success() when result.data.statusCode == 200:
        final data = JSONDecoder().decode<R, T>(result.data.data, fromJson);
        return _handleData(data);
      case Success() when result.data.statusCode == 404:
        final data =
            JSONDecoder().decode<E, E>(result.data.data, errorFromJson);
        return _handleError(data);
      case Success() when result.data.statusCode == 401:
        return Failure(NetworkError.tokenExpired());
      case Failure():
        return Failure(
          NetworkError(message: result.error.message, type: result.error.type),
        );
      default:
        return Failure(NetworkError.unknown());
    }
  }

  static Result<R, NetworkError<E>> _handleData<R, E>(R? data) {
    if (data == null) {
      return Failure(NetworkError.decodingError());
    }

    return Success(data);
  }

  static Result<R, NetworkError<E>> _handleError<R, E>(E? data) {
    if (data == null) {
      return Failure(NetworkError.decodingError());
    }

    return Failure(NetworkError.badResponse(data: data));
  }
}
