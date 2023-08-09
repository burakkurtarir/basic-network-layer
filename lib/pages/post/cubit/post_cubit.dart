import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:network_layer_2/core/network/model/response_state.dart';
import 'package:network_layer_2/core/network/model/result.dart';
import 'package:network_layer_2/pages/post/model/post_model.dart';
import 'package:network_layer_2/pages/post/service/base_post_service.dart';
import 'package:network_layer_2/product/general_error_model.dart';

part 'post_state.dart';

final class PostCubit extends Cubit<PostState> {
  final BasePostService postService;
  PostCubit({required this.postService})
      : super(const PostState(responseState: LoadingState())) {
    fetchPost();
  }

  Future<void> fetchPost() async {
    final result = await postService.fetchPost();
    await Future.delayed(const Duration(seconds: 2));

    switch (result) {
      case Success():
        emit(state.copyWith(
            postModel: result.data, responseState: const SuccessState()));
        return;
      case Failure():
        emit(
          state.copyWith(
            responseState: ErrorState(error: result.error),
            errorModel: result.error.data,
          ),
        );
        return;
    }
  }
}
