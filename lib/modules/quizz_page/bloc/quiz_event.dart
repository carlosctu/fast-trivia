import 'package:fast_trivia/domain/model/quiz_section_view_data.dart';

abstract class QuizEvent {}

class QuizEventUpdateUserAnswers extends QuizEvent {
  final int questionId;
  final int answer;
  QuizEventUpdateUserAnswers({
    required this.questionId,
    required this.answer,
  });
}

class QuizEventCreateUserAnswers extends QuizEvent {
  final int questionsLength;
  QuizEventCreateUserAnswers({
    required this.questionsLength,
  });
}

class QuizEventShouldShowSendQuizBtn extends QuizEvent {}

class QuizEventCompleteQuiz extends QuizEvent {
  final List<int> quizAnswers;
  final List<int> userAnswers;

  QuizEventCompleteQuiz({
    required this.quizAnswers,
    required this.userAnswers,
  });
}

class QuizEventSubmitQuiz extends QuizEvent {
  final QuizSectionViewData quiz;
  QuizEventSubmitQuiz({
    required this.quiz,
  });
}
