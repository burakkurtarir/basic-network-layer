import 'package:dio/dio.dart';
import 'package:network_layer_2/core/network/service/base_network_service.dart';
import 'package:network_layer_2/core/network/extension/dio_extensions.dart';
import 'package:network_layer_2/core/network/model/network_error.dart';
import 'package:network_layer_2/core/network/enum/request_method.dart';
import 'package:network_layer_2/core/network/model/response_model.dart';

final class SimpleNetworkService
    with DioMixin
    implements BaseNetworkService, Dio {
  SimpleNetworkService() {
    options = BaseOptions();
    httpClientAdapter = HttpClientAdapter();
  }

  @override
  Future<(ResponseModel?, NetworkError?)> send(String url,
      {RequestMethod method = RequestMethod.get,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      Object? data}) async {
    try {
      final response = await request(
        url,
        queryParameters: queryParameters,
        data: data,
        options: Options(method: method.rawValue, headers: headers),
      );

      final responseModel = response.toResponseModel();

      return (responseModel, null);
    } on DioException catch (e) {
      if (e.response != null) {
        return (e.response.toResponseModel(), null);
      }

      return (null, e.toNetworkError());
    } catch (e) {
      return (null, NetworkError.unknown());
    }
  }
}
