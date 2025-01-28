part of 'post_list_bloc.dart';

sealed class PostListEvent extends Equatable {
  const PostListEvent();
}

class PostListPostsFetched extends PostListEvent {
  const PostListPostsFetched();

  @override
  List<Object> get props => [];
}
