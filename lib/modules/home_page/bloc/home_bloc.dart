import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fast_trivia/domain/repositories/quizzes_repository.dart';
import 'package:fast_trivia/modules/home_page/bloc/home_event.dart';
import 'package:fast_trivia/modules/home_page/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final QuizzesRepository _repository;

  HomeBloc(this._repository) : super(const HomeState.initial()) {
    on<HomeEventFetchQuizzes>(_onFetchHomeQuizzes);
  }

  void _onFetchHomeQuizzes(
    HomeEventFetchQuizzes event,
    Emitter emit,
  ) async {
    emit(state.loading());

    try {
      final result = await _repository.getQuizzes();
      emit(state.validState(result.quizzes));
    } on Exception catch (ex) {
      emit(state.invalidState(ex));
    }
  }
}
