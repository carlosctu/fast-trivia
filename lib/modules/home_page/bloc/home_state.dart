import 'package:fast_trivia/domain/model/quiz_section_view_data.dart';

enum HomeStatus { complete, loading, error }

class HomeState {
  final HomeStatus status;
  final List<QuizSectionViewData> quizzes;
  final Exception? exception;
  const HomeState._({
    this.status = HomeStatus.loading,
    this.quizzes = const [],
    this.exception,
  });

  const HomeState.initial() : this._();

  HomeState loading() => copyWith(status: HomeStatus.loading);

  HomeState validState(List<QuizSectionViewData> data) => copyWith(
        status: HomeStatus.complete,
        quizzes: data,
      );

  HomeState invalidState(Exception? ex) => copyWith(
        status: HomeStatus.complete,
        exception: ex,
      );

  HomeState copyWith({
    HomeStatus? status,
    List<QuizSectionViewData>? quizzes,
    Exception? exception,
  }) {
    return HomeState._(
      status: status ?? this.status,
      quizzes: quizzes ?? this.quizzes,
      exception: exception ?? this.exception,
    );
  }
}
