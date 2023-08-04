part of 'post_cubit.dart';

final class PostState extends Equatable {
  const PostState({
    this.postModel,
    required this.responseState,
    this.errorModel,
  });

  final PostModel? postModel;

  final ResponseState responseState;

  final GeneralErrorModel? errorModel;

  @override
  List<Object?> get props => [postModel, responseState, errorModel];

  PostState copyWith({
    PostModel? postModel,
    ResponseState? responseState,
    GeneralErrorModel? errorModel,
  }) {
    return PostState(
      responseState: responseState ?? this.responseState,
      postModel: postModel ?? this.postModel,
      errorModel: errorModel ?? this.errorModel,
    );
  }
}
