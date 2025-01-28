import 'dart:async';

import 'package:base/base.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thematic_group/src/group_filter/models/ui_category_list_item.dart';
import 'package:ui/ui.dart';

part 'group_filter_event.dart';

part 'group_filter_state.dart';

class GroupFilterBloc extends Bloc<GroupFilterEvent, GroupFilterState> {
  GroupFilterBloc({
    required List<ThematicGroupCategory> selectedCategories,
    GetGroupCategoriesUseCase? getGroupCategoriesUseCase,
  })  : _getGroupCategoriesUseCase = getGroupCategoriesUseCase ?? getIt(),
        super(GroupFilterState.create(
          selectedCategories: selectedCategories,
        )) {
    on<GroupFilterCategoriesFetched>(
      _handleCategoriesFetched,
      transformer: restartable(),
    );
    on<GroupFilterCategoryCheckChanged>(_handleCategoryCheckChanged);
    on<GroupFilterAllCategoriesCheckChanged>(_handleAllCategoriesCheckChanged);
  }

  final GetGroupCategoriesUseCase _getGroupCategoriesUseCase;

  FutureOr<void> _handleCategoriesFetched(
    GroupFilterCategoriesFetched event,
    Emitter<GroupFilterState> emit,
  ) async {
    emit(
      state.copyWith(
        categoriesUiState: const UiStateInProgress(),
      ),
    );

    try {
      final result = await _getGroupCategoriesUseCase();
      emit(
        state.copyWith(
          categoriesUiState: UiStateSuccess(
            result
                .map(
                  (category) => UiCategoryListItem(
                    category: category,
                    isSelected: _isSelected(state.selectedCategories, category),
                  ),
                )
                .toList(),
          ),
        ),
      );
    } catch (e, s) {
      logger.e('Error fetching categories', e, s);
      emit(
        state.copyWith(
          categoriesUiState: UiStateFailure.fromError(e.toString()),
        ),
      );
    }
  }

  bool _isSelected(List<ThematicGroupCategory> selectedCategories,
      ThematicGroupCategory category) {
    return selectedCategories.indexWhere((c) => c.id == category.id) != -1;
  }

  Future<void> _handleCategoryCheckChanged(
    GroupFilterCategoryCheckChanged event,
    Emitter<GroupFilterState> emit,
  ) async {
    final updatedCategories =
        List<ThematicGroupCategory>.from(state.selectedCategories);
    final category = event.category;
    final isSelected = event.isSelected;
    if (isSelected) {
      updatedCategories.add(category);
    } else {
      updatedCategories.removeWhere((c) => c.id == category.id);
    }

    emit(
      state.copyWith(
        selectedCategories: updatedCategories,
        categoriesUiState: UiStateSuccess(
          state.categoriesUiState.dataOrNull
                  ?.map((item) => item.copyWith(
                      isSelected:
                          _isSelected(updatedCategories, item.category)))
                  .toList() ??
              [],
        ),
      ),
    );
  }

  Future<void> _handleAllCategoriesCheckChanged(
    GroupFilterAllCategoriesCheckChanged event,
    Emitter<GroupFilterState> emit,
  ) async {
    final isSelected = event.isSelected;
    final updatedCategories = isSelected
        ? state.categoriesUiState.dataOrNull
                ?.map((item) => item.copyWith(isSelected: true))
                .toList() ??
            []
        : state.categoriesUiState.dataOrNull
                ?.map((item) => item.copyWith(isSelected: false))
                .toList() ??
            [];

    emit(
      state.copyWith(
        selectedCategories: isSelected
            ? state.categoriesUiState.dataOrNull
                    ?.map((item) => item.category)
                    .toList() ??
                []
            : [],
        categoriesUiState: UiStateSuccess(updatedCategories),
      ),
    );
  }
}
