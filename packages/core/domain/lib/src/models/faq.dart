import 'package:base/base.dart';

class Faq extends Equatable {
  final String id;
  final String categoryId;
  final String question;
  final String answer;

  const Faq({
    required this.id,
    required this.categoryId,
    required this.question,
    required this.answer,
  });

  @override
  List<Object?> get props => [
        id,
        categoryId,
        question,
        answer,
      ];
}
