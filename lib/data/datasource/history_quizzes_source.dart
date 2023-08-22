import 'dart:convert';
import 'package:fast_trivia/domain/mapper/history_quizzes_mapper.dart';
import 'package:fast_trivia/domain/model/quiz_section_view_data.dart';
import 'package:fast_trivia/domain/repositories/models/history_quiz.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryQuizzesSource {
  static late SharedPreferences _preferences;
  static const String historyList = 'history_list_key';

  static init() async => _preferences = await SharedPreferences.getInstance();

  Future<List<String>> _getHistoryQuizzes() async {
    return _preferences.getStringList(historyList) ?? [];
  }

  Future saveQuizOnHistory(QuizSectionViewData selectedQuiz) async {
    List<String> historyQuizzes = await _getHistoryQuizzes();
    final mappedQuizzes = selectedQuiz.mapHistoryQuizzes();
    String quiz = jsonEncode(mappedQuizzes.toJson());
    historyQuizzes.add(quiz);
    await _preferences.setStringList(historyList, historyQuizzes);
  }

  Future<List<HistoryQuiz>> getDecodedHistoryQuizzes() async {
    List<String> historyQuizzes = await _getHistoryQuizzes();
    List<HistoryQuiz> decodedQuizzes = historyQuizzes
        .map((e) => HistoryQuiz.fromJson(jsonDecode(e)))
        .toList();

    return decodedQuizzes;
  }
}
