import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ELibrarySubjectChangeCubit extends Cubit<Subject?> {
  ELibrarySubjectChangeCubit() : super(null);

  void changeSubject(Subject? value) async {
    emit(value);
  }
}
