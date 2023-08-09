import 'package:network_layer_2/core/network/index.dart';
import 'package:network_layer_2/core/parsing/index.dart';
import 'package:network_layer_2/pages/post/model/post_model.dart';
import 'package:network_layer_2/pages/post/service/base_post_service.dart';
import 'package:network_layer_2/product/general_error_model.dart';
import 'package:network_layer_2/product/network_urls.dart';

final class PostService extends BasePostService {
  PostService() : super(SimpleNetworkService());

  @override
  Future<Result<PostModel, NetworkError<GeneralErrorModel>>> fetchPost() async {
    final result = await networkService.send(NetworkURLs.post2);

    return GenericResponseMapperWithError.map<PostModel, PostModel,
        GeneralErrorModel>(
      result,
      PostModel.fromJson,
      GeneralErrorModel.fromJson,
    );
  }
}
