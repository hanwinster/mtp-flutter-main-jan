import 'package:flutter_bloc/flutter_bloc.dart';


class ChangeSlideCubit extends Cubit<int> {
  ChangeSlideCubit() : super(0);

  void changeSlide(int index) async {
    emit(index);
  }
}
