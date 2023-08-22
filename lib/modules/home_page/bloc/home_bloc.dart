import 'package:fast_trivia/domain/use_cases/get_history_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fast_trivia/domain/use_cases/get_quizzes_use_case.dart';
import 'package:fast_trivia/modules/home_page/bloc/home_event.dart';
import 'package:fast_trivia/modules/home_page/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetQuizzesUseCase _getQuizzesUseCase;
  final GetHistoryUseCase _getHistoryUseCase;

  HomeBloc(
    this._getQuizzesUseCase,
    this._getHistoryUseCase,
  ) : super(const HomeState.initial()) {
    on<HomeEventFetchQuizzes>(_onFetchHomeQuizzes);
    on<HomeEventFetchHistoryQuizzes>(_onFetchHistoryQuizzes);
  }

  void _onFetchHomeQuizzes(
    HomeEventFetchQuizzes event,
    Emitter emit,
  ) async {
    emit(state.loading());

    try {
      final result = await _getQuizzesUseCase.execute();

      if (result.quizzes.isEmpty) {
        emit(state.emptyState());
      } else {
        emit(state.validQuizzesState(result.quizzes));
      }
    } on Exception catch (ex) {
      emit(state.invalidState(ex));
    }
  }

  void _onFetchHistoryQuizzes(
    HomeEventFetchHistoryQuizzes event,
    Emitter emit,
  ) async {
    emit(state.loading());

    try {
      final result = await _getHistoryUseCase.execute();

      if (result.isEmpty) {
        emit(state.emptyState());
      } else {
        emit(state.validHistoryState(result));
      }
    } on Exception catch (ex) {
      emit(state.invalidState(ex));
    }
  }
}
