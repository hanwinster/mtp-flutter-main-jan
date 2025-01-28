import 'dart:async';

import 'package:base/base.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:blog/src/common/models/models.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:ui/ui.dart';

import '../models/blog_filter.dart';

part 'blog_event.dart';

part 'blog_state.dart';

const _debounceDuration = Duration(milliseconds: 300);

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  BlogBloc({
    ObserveBlogPostCategoriesUseCase? observeBlogPostCategoriesUseCase,
    ObserveLatestBlogPostsUseCase? observeLatestBlogPostsUseCase,
    ObserveRecommendedBlogPostsUseCase? observeRecommendedBlogPostsUseCase,
    ObserveBlogPostsByCategoryUseCase? observeBlogPostsByCategoryUseCase,
  })  : _observeLatestBlogPostsUseCase =
            observeLatestBlogPostsUseCase ?? getIt(),
        _observeBlogPostCategoriesUseCase =
            observeBlogPostCategoriesUseCase ?? getIt(),
        _observeRecommendedBlogPostsUseCase =
            observeRecommendedBlogPostsUseCase ?? getIt(),
        _observeBlogPostsByCategoryUseCase =
            observeBlogPostsByCategoryUseCase ?? getIt(),
        super(BlogState.empty()) {
    on<BlogFilteredPostsFetched>(_handleFilteredPostFetched,
        transformer: restartable());
    on<BlogLatestPostsFetched>(_handleLatestPostsFetched,
        transformer: restartable());
    on<BlogPostCategoriesFetched>(_handleCategoriesFetched,
        transformer: restartable());
    on<BlogPostCategoryToggled>(_handleCategoryToggled);
    on<BlogPostKeywordChanged>(_handleKeywordChanged, transformer: debounce(_debounceDuration));
    on<BlogRecommendedPostsFetched>(_handleRecommendedPostsFetched,
        transformer: restartable());

    categoryStream = StreamController<BlogPostCategory?>(sync: true);
    categorySubscription = categoryStream.stream.listen((category) {
      logger.d('Category changed: $category, rdy to filtered post');
    });
  }

  final ObserveLatestBlogPostsUseCase _observeLatestBlogPostsUseCase;
  final ObserveRecommendedBlogPostsUseCase _observeRecommendedBlogPostsUseCase;
  final ObserveBlogPostsByCategoryUseCase _observeBlogPostsByCategoryUseCase;
  final ObserveBlogPostCategoriesUseCase _observeBlogPostCategoriesUseCase;

  late StreamController<BlogPostCategory?> categoryStream;
  late StreamSubscription<BlogPostCategory?> categorySubscription;

  FutureOr<void> _handleLatestPostsFetched(
    BlogLatestPostsFetched event,
    Emitter<BlogState> emit,
  ) async {
    emit(state.copyWith(
      latestPostsUiState: const UiStateInProgress(),
    ));

    await emit.forEach(
      _observeLatestBlogPostsUseCase(),
      onData: (posts) {
        return state.copyWith(
          latestPostsUiState: UiState.fromResult(posts),
        );
      },
      onError: (e, s) {
        logger.e('Error fetching latest posts', e, s);
        return state.copyWith(
          latestPostsUiState: UiStateFailure.fromError(e),
        );
      },
    );
  }

  FutureOr<void> _handleFilteredPostFetched(
    BlogFilteredPostsFetched event,
    Emitter<BlogState> emit,
  ) async {
    emit(state.copyWith(
      filteredPostsUiState: const UiStateInProgress(),
    ));

    final category = event.filter.category;
    final keyword = event.filter.keyword;

    await emit.forEach(
      (category == null && keyword.isEmpty)
          ? _observeRecommendedBlogPostsUseCase()
          : _observeBlogPostsByCategoryUseCase(
              ObserveBlogPostsByCategoryRequest(
                categoryId: category?.id ?? '',
                keyword: keyword,
              ),
            ),
      onData: (posts) {
        return state.copyWith(
          filteredPostsUiState: UiState.fromResult(posts),
        );
      },
      onError: (e, s) {
        logger.e('Error fetching filtered posts', e, s);
        return state.copyWith(
          filteredPostsUiState: UiStateFailure.fromError(e),
        );
      },
    );
  }

  FutureOr<void> _handleCategoriesFetched(
    BlogPostCategoriesFetched event,
    Emitter<BlogState> emit,
  ) async {
    emit(state.copyWith(
      categoriesUiState: const UiStateInProgress(),
    ));
    await emit.forEach(
      _observeBlogPostCategoriesUseCase(),
      onData: (categories) {
        return state.copyWith(
          categoriesUiState: UiState.fromResultTransform(
            categories,
            (categories) {
              return categories.map((category) {
                return SelectableCategoryItemState(
                  category: category,
                  isSelected: state.filter.category?.id == category.id,
                );
              }).toList();
            },
          ),
        );
      },
      onError: (e, s) {
        return state.copyWith(
          categoriesUiState: UiStateFailure.fromError(e),
        );
      },
    );
  }

  FutureOr<void> _handleCategoryToggled(
    BlogPostCategoryToggled event,
    Emitter<BlogState> emit,
  ) async {
    final updatedSelectedItem =
        event.item.isSelected ? null : event.item.category;
    final updatedFilter =
        state.filter.copyWith(category: () => updatedSelectedItem);

    emit(
      state.copyWith(
        filter: updatedFilter,
        categoriesUiState: state.categoriesUiState.map((items) {
          return items.map((item) {
            return item.copyWith(
                isSelected: item.category.id == updatedSelectedItem?.id);
          }).toList();
        }),
      ),
    );

    add(BlogFilteredPostsFetched(updatedFilter));
  }

  Future<void> _handleKeywordChanged(
    BlogPostKeywordChanged event,
    Emitter<BlogState> emit,
  ) async {
    final updatedFilter = state.filter.copyWith(keyword: () => event.keyword);
    emit(
      state.copyWith(
        filter: updatedFilter,
      ),
    );
    add(BlogFilteredPostsFetched(updatedFilter));
  }

  FutureOr<void> _handleRecommendedPostsFetched(
    BlogRecommendedPostsFetched event,
    Emitter<BlogState> emit,
  ) async {
    add(BlogFilteredPostsFetched(BlogFilter.empty()));
  }
}
