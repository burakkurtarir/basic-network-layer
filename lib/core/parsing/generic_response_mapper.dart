import 'package:network_layer_2/core/network/model/network_error.dart';
import 'package:network_layer_2/core/network/model/result.dart';
import 'package:network_layer_2/core/network/model/response_model.dart';
import 'package:network_layer_2/core/parsing/json_decoder.dart';

/// Use this class when API doesn't return a custom error model
final class GenericResponseMapper {
  static Result<R, NetworkError> map<R, T>(
    Result<ResponseModel, NetworkError> result,
    T Function(Map<String, dynamic> json) fromJson,
  ) {
    switch (result) {
      case Success() when result.data.statusCode == 200:
        final data = JSONDecoder().decode<R, T>(result.data.data, fromJson);
        return _handleData(data);
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

  static Result<R, NetworkError> _handleData<R>(R? data) {
    if (data == null) {
      return Failure(NetworkError.decodingError());
    }

    return Success(data);
  }
}
