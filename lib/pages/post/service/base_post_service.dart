import 'package:network_layer_2/core/network/index.dart';
import 'package:network_layer_2/pages/post/model/post_model.dart';
import 'package:network_layer_2/product/general_error_model.dart';

abstract class BasePostService {
  final BaseNetworkService networkService;
  const BasePostService(this.networkService);

  Future<Result<PostModel, NetworkError<GeneralErrorModel>>> fetchPost();
}
