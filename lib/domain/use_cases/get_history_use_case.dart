import 'package:fast_trivia/data/datasource/history_quizzes_source.dart';
import 'package:fast_trivia/domain/repositories/models/history_quiz.dart';

class GetHistoryUseCase {
  final HistoryQuizzesSource _historyQuizzesSource = HistoryQuizzesSource();

  Future<List<HistoryQuiz>> execute() async {
    return _historyQuizzesSource.getDecodedHistoryQuizzes();
  }
}
