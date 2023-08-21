class QuizState {
  final List<int> userAnswers;
  final int? questionId;
  final bool isQuizDone;
  const QuizState._({
    this.userAnswers = const [],
    this.questionId,
    this.isQuizDone = false,
  });

  const QuizState.initial() : this._();

  QuizState copyWith({
    List<int>? userAnswers,
    int? questionId,
    bool? isQuizDone,
  }) {
    return QuizState._(
      userAnswers: userAnswers ?? this.userAnswers,
      questionId: questionId ?? this.questionId,
      isQuizDone: isQuizDone ?? this.isQuizDone,
    );
  }
}
