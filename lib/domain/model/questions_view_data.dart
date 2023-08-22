import 'package:equatable/equatable.dart';

class QuestionsViewData extends Equatable {
  final int id;
  final String section;
  final String title;
  final int questionAnswer;
  final List<QuestionsAlternativesViewData> alternatives;
  const QuestionsViewData({
    required this.id,
    required this.section,
    required this.title,
    required this.questionAnswer,
    required this.alternatives,
  });

  @override
  List<Object> get props {
    return [
      id,
      section,
      title,
      questionAnswer,
      alternatives,
    ];
  }
}

class QuestionsAlternativesViewData extends Equatable {
  final int id;
  final String title;
  const QuestionsAlternativesViewData({
    required this.id,
    required this.title,
  });

  @override
  List<Object> get props => [id, title];
}
