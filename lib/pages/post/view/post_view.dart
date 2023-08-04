import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_layer_2/core/network/model/response_state.dart';
import 'package:network_layer_2/pages/post/cubit/post_cubit.dart';
import 'package:network_layer_2/pages/post/service/post_service.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostCubit(postService: PostService()),
      child: const PostView(),
    );
  }
}

class PostView extends StatelessWidget {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Model'),
      ),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          final responseState = state.responseState;

          switch (responseState) {
            case InitialState():
              return const SizedBox.shrink();
            case LoadingState():
              return const Center(child: CircularProgressIndicator.adaptive());
            case SuccessState():
              return ListTile(
                title: Text(state.postModel?.title ?? "None"),
                subtitle: Text(state.postModel?.id.toString() ?? "None"),
              );
            case ErrorState() when state.errorModel != null:
              return ListTile(
                title: Text(state.errorModel?.reason ?? "None"),
                subtitle: Text(state.errorModel?.description ?? "None"),
              );
            case ErrorState():
              return Center(child: Text(responseState.message));
          }
        },
      ),
    );
  }
}
