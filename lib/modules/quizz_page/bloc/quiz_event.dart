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
