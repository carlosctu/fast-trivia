import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fast_trivia/modules/quizz_page/bloc/quiz_event.dart';
import 'package:fast_trivia/modules/quizz_page/bloc/quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(const QuizState.initial()) {
    on<QuizEventCreateUserAnswers>(_onCreateUserAnswers);
    on<QuizEventUpdateUserAnswers>(_onUpdateUserAnswers);
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
}
