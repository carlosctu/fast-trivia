import 'package:fast_trivia/domain/models/quizz_section.dart';

enum HomeStatus { complete, loading, error }

class HomeState {
  final HomeStatus status;
  final List<QuizzSection> quizzes;
  final Exception? exception;
  const HomeState._({
    this.status = HomeStatus.loading,
    this.quizzes = const [],
    this.exception,
  });

  const HomeState.initial() : this._();

  HomeState loading() => copyWith(status: HomeStatus.loading);

  HomeState validState(List<QuizzSection> data) => copyWith(
        status: HomeStatus.complete,
        quizzes: data,
      );

  HomeState invalidState(Exception? ex) => copyWith(
        status: HomeStatus.complete,
        exception: ex,
      );

  HomeState copyWith({
    HomeStatus? status,
    List<QuizzSection>? quizzes,
    Exception? exception,
  }) {
    return HomeState._(
      status: status ?? this.status,
      quizzes: quizzes ?? this.quizzes,
      exception: exception ?? this.exception,
    );
  }
}
