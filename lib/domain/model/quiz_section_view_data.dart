import 'package:equatable/equatable.dart';

import 'package:fast_trivia/domain/model/questions_view_data.dart';

class QuizSectionViewData extends Equatable {
  final int id;
  final String title;
  final List<QuestionsViewData> questions;
  final List<int> answers;
  const QuizSectionViewData({
    required this.id,
    required this.title,
    required this.questions,
    required this.answers,
  });

  @override
  List<Object> get props => [id, title, questions];
}
