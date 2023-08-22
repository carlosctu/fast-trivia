import 'package:fast_trivia/data/datasource/history_quizzes_source.dart';
import 'package:fast_trivia/domain/model/quiz_section_view_data.dart';

class SaveQuizzesOnHistoryUseCase {
  final HistoryQuizzesSource _historyQuizzesSource = HistoryQuizzesSource();

  Future execute(QuizSectionViewData quiz) async {
    await _historyQuizzesSource.saveQuizOnHistory(quiz);
  }
}
