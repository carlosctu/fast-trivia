import 'package:fast_trivia/domain/model/quiz_section_view_data.dart';
import 'package:fast_trivia/domain/repositories/models/history_quiz.dart';

enum HomeStatus { complete, loading, error }

class HomeState {
  final HomeStatus status;
  final List<QuizSectionViewData> quizzes;
  final List<HistoryQuiz> historyQuizzes;
  final Exception? exception;
  const HomeState._({
    this.status = HomeStatus.loading,
    this.quizzes = const [],
    this.historyQuizzes = const [],
    this.exception,
  });

  const HomeState.initial() : this._();

  HomeState loading() => copyWith(status: HomeStatus.loading);

  HomeState validQuizzesState(List<QuizSectionViewData> data) => copyWith(
        status: HomeStatus.complete,
        quizzes: data,
      );

  HomeState validHistoryState(List<HistoryQuiz> data) => copyWith(
        status: HomeStatus.complete,
        historyQuizzes: data,
      );

  HomeState invalidState(Exception? ex) => copyWith(
        status: HomeStatus.complete,
        exception: ex,
      );

  HomeState copyWith({
    HomeStatus? status,
    List<QuizSectionViewData>? quizzes,
    List<HistoryQuiz>? historyQuizzes,
    Exception? exception,
  }) {
    return HomeState._(
      status: status ?? this.status,
      quizzes: quizzes ?? this.quizzes,
      historyQuizzes: historyQuizzes ?? this.historyQuizzes,
      exception: exception ?? this.exception,
    );
  }
}
