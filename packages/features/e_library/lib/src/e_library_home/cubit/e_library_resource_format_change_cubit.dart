import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ELibraryResourceFormatChangeCubit extends Cubit<ResourceFormat?> {
  ELibraryResourceFormatChangeCubit() : super(null);

  void changeResourceFormat(ResourceFormat? value) async {
    emit(value);
  }
}
