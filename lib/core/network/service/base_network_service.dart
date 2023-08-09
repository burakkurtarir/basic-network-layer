import 'package:network_layer_2/core/network/model/network_error.dart';
import 'package:network_layer_2/core/network/enum/request_method.dart';
import 'package:network_layer_2/core/network/model/response_model.dart';
import 'package:network_layer_2/core/network/model/result.dart';

abstract class BaseNetworkService {
  /// Responsible for making HTTP requests to a specified URL<br>
  /// Handles both successful responses and potential errors in the network interactions efficiently
  Future<Result<ResponseModel, NetworkError>> send(
    String url, {
    RequestMethod method = RequestMethod.get,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Object? data,
  });
}
