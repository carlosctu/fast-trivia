import 'package:equatable/equatable.dart';

import 'package:fast_trivia/domain/model/questions_view_data.dart';

class QuizSectionViewData extends Equatable {
  final int id;
  final String title;
  final List<QuestionsViewData> questions;
  final List<int> answers;
  final List<int> userAnswers;
  final double score;
  const QuizSectionViewData({
    required this.id,
    required this.title,
    required this.questions,
    required this.answers,
    this.userAnswers = const [],
    this.score = 0.0,
  });

  @override
  List<Object> get props => [id, title, questions];

  QuizSectionViewData copyWith({
    int? id,
    String? title,
    List<QuestionsViewData>? questions,
    List<int>? answers,
    List<int>? userAnswers,
    double? score,
  }) {
    return QuizSectionViewData(
      id: id ?? this.id,
      title: title ?? this.title,
      questions: questions ?? this.questions,
      answers: answers ?? this.answers,
      userAnswers: userAnswers ?? this.userAnswers,
      score: score ?? this.score,
    );
  }
}
