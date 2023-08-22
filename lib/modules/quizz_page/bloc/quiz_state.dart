class QuizState {
  final List<int> userAnswers;
  final int? questionId;
  final bool isQuizDone;
  final String score;
  const QuizState._({
    this.userAnswers = const [],
    this.questionId,
    this.isQuizDone = false,
    this.score = "0",
  });

  const QuizState.initial() : this._();

  QuizState copyWith({
    List<int>? userAnswers,
    int? questionId,
    bool? isQuizDone,
    String? score,
  }) {
    return QuizState._(
      userAnswers: userAnswers ?? this.userAnswers,
      questionId: questionId ?? this.questionId,
      isQuizDone: isQuizDone ?? this.isQuizDone,
      score: score ?? this.score,
    );
  }
}
