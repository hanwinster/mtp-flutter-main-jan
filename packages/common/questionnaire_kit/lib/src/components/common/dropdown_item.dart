import 'package:equatable/equatable.dart';
import 'package:questionnaire_kit/questionnaire_kit.dart';

class QkDropdownItem extends Equatable {
  const QkDropdownItem({required this.option});

  final AnswerOption option;

  @override
  List<Object> get props => [option];
}