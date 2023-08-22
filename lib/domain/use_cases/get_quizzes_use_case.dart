import 'package:fast_trivia/data/datasource/history_quizzes_source.dart';
import 'package:fast_trivia/domain/mapper/quizzes_mapper.dart';
import 'package:fast_trivia/domain/model/quizzes_view_data.dart';
import 'package:fast_trivia/domain/repositories/quizzes_repository.dart';

class GetQuizzesUseCase {
  final QuizzesRepository _repository;
  GetQuizzesUseCase(this._repository);

  final _preference = HistoryQuizzesSource();

  Future<QuizzesViewData> execute() async {
    final result = await _repository.getQuizzes();
    final historyQuizzes = await _preference.getDecodedHistoryQuizzes();

    for (var quiz in historyQuizzes) {
      result.quizzes.removeWhere((element) => element.id == quiz.id);
    }

    return result.toViewData();
  }
}
