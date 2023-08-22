import 'package:equatable/equatable.dart';

import 'package:fast_trivia/domain/model/quiz_section_view_data.dart';

class QuizzesViewData extends Equatable {
  final List<QuizSectionViewData> quizzes;
  const QuizzesViewData({
    required this.quizzes,
  });

  @override
  List<Object> get props => [quizzes];
}
