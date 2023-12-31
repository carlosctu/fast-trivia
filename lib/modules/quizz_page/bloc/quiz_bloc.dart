import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fast_trivia/domain/use_cases/save_quizzes_on_history_use_case.dart';
import 'package:fast_trivia/modules/quizz_page/bloc/quiz_event.dart';
import 'package:fast_trivia/modules/quizz_page/bloc/quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final SaveQuizzesOnHistoryUseCase _saveQuizzesOnHistoryUseCase;
  QuizBloc(
    this._saveQuizzesOnHistoryUseCase,
  ) : super(const QuizState.initial()) {
    on<QuizEventCreateUserAnswers>(_onCreateUserAnswers);
    on<QuizEventUpdateUserAnswers>(_onUpdateUserAnswers);
    on<QuizEventShouldShowSendQuizBtn>(_onShouldShowSentQuizBtn);
    on<QuizEventCompleteQuiz>(_onQuizComplete);
    on<QuizEventSubmitQuiz>(_onQuizSubmitted);
  }

  void _onCreateUserAnswers(QuizEventCreateUserAnswers event, Emitter emit) {
    final userAnswers = List.generate(event.questionsLength, (index) => 0);
    emit(state.copyWith(
      userAnswers: userAnswers,
      isQuizDone: false,
    ));
  }

  void _onUpdateUserAnswers(
    QuizEventUpdateUserAnswers event,
    Emitter emit,
  ) {
    final userAnswers = state.userAnswers;
    userAnswers[event.questionId] = event.answer;
    final isQuizInProgress = userAnswers.any((answer) => answer == 0);

    if (isQuizInProgress) {
      emit(state.copyWith(userAnswers: userAnswers));
    } else {
      emit(state.copyWith(
        userAnswers: userAnswers,
        isQuizDone: true,
      ));
    }
  }

  void _onShouldShowSentQuizBtn(
    QuizEventShouldShowSendQuizBtn event,
    Emitter emit,
  ) {
    emit(state.copyWith(isQuizDone: true));
  }

  void _onQuizComplete(
    QuizEventCompleteQuiz event,
    Emitter emit,
  ) {
    final quizAnswers = event.quizAnswers;
    final userAnswers = event.userAnswers;
    int correctAnswers = 0;

    for (var index = 0; index < quizAnswers.length; index++) {
      if (quizAnswers[index] == userAnswers[index]) {
        correctAnswers++;
      }
    }

    final score = (correctAnswers / quizAnswers.length) * 100;

    emit(state.copyWith(score: score));
  }

  void _onQuizSubmitted(
    QuizEventSubmitQuiz event,
    Emitter emit,
  ) {
    _saveQuizzesOnHistoryUseCase.execute(event.quiz.copyWith(
      userAnswers: state.userAnswers,
      score: state.score,
    ));
  }
}
