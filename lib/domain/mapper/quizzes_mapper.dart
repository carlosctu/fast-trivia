import 'package:fast_trivia/domain/model/questions_view_data.dart';
import 'package:fast_trivia/domain/model/quiz_section_view_data.dart';
import 'package:fast_trivia/domain/model/quizzes_view_data.dart';
import 'package:fast_trivia/domain/repositories/models/questions.dart';
import 'package:fast_trivia/domain/repositories/models/quizzes_response.dart';

extension QuizzesMapper on QuizzesResponse {
  QuizzesViewData toViewData() {
    return QuizzesViewData(
      quizzes: quizzes
          .map(
            (quizSection) => QuizSectionViewData(
              id: quizSection.id,
              title: quizSection.title,
              questions: quizSection.questions
                  .map(
                    (question) => QuestionsViewData(
                      id: question.id,
                      section: question.section,
                      title: question.title,
                      questionAnswer: question.questionAnswer,
                      alternatives: question.alternatives
                          .map((alternative) => QuestionsAlternativesViewData(
                                id: alternative.id,
                                title: alternative.title,
                              ))
                          .toList(),
                    ),
                  )
                  .toList(),
              answers: _getQuizAnswers(quizSection.questions),
            ),
          )
          .toList(),
    );
  }

  List<int> _getQuizAnswers(List<Questions> questions) {
    return questions.map((question) => question.questionAnswer).toList();
  }
}
