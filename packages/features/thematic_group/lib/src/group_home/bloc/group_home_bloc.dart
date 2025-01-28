import 'dart:async';

import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'group_home_event.dart';

part 'group_home_state.dart';

class GroupHomeBloc extends Bloc<GroupHomeEvent, GroupHomeState> {
  GroupHomeBloc() : super(GroupHomeState.create()) {
    on<GroupHomeCategoriesChanged>(
      _handleCategoriesChanged,
    );
  }

  Future<void> _handleCategoriesChanged(
    GroupHomeCategoriesChanged event,
    Emitter<GroupHomeState> emit,
  ) async {
    emit(
      state.copyWith(
        selectedCategories: event.categories,
      ),
    );
  }
}
