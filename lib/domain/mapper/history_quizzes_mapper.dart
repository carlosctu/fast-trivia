import 'package:fast_trivia/domain/model/quiz_section_view_data.dart';
import 'package:fast_trivia/domain/repositories/models/history_quiz.dart';

extension HistoryQuizzesMapper on QuizSectionViewData {
  HistoryQuiz mapHistoryQuizzes() {
    return HistoryQuiz(
      id: id,
      title: title,
      questions: questions
          .map(
            (e) => Questions(
              id: e.id,
              section: e.section,
              title: e.title,
              questionAnswer: e.questionAnswer,
              alternatives: e.alternatives
                  .map((e) => QuestionAlternatives(
                        id: e.id,
                        title: e.title,
                      ))
                  .toList(),
            ),
          )
          .toList(),
      answers: answers,
      userAnswers: userAnswers,
      score: score,
    );
  }
}
