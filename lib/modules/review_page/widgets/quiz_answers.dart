import 'package:flutter/material.dart';
import 'package:fast_trivia/domain/repositories/models/history_quiz.dart';

class QuizAnswers extends StatelessWidget {
  final int questionId;
  final HistoryQuiz quizSection;
  final PageController controller;
  final List<QuestionAlternatives> alternatives;
  const QuizAnswers({
    Key? key,
    required this.questionId,
    required this.quizSection,
    required this.controller,
    required this.alternatives,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: alternatives.length,
        itemBuilder: (context, index) {
          final questionAnswer = quizSection.answers[questionId - 1];
          final alternative = alternatives[index];
          final userAnswer = quizSection.userAnswers[questionId - 1];
          final isSelectedAnswer = userAnswer == alternative.id;

          Color? getAnswerContainerColor() {
            if (isSelectedAnswer) {
              final isCorrectAnswer = userAnswer == questionAnswer;
              return isCorrectAnswer ? Colors.green[100] : Colors.red[100];
            } else {
              return questionAnswer == alternative.id
                  ? Colors.green[100]
                  : Colors.grey[100];
            }
          }

          return Container(
            margin: const EdgeInsets.only(right: 8),
            child: InkWell(
              child: Ink(
                padding: const EdgeInsets.all(20),
                color: getAnswerContainerColor(),
                child: Text(
                  alternatives[index].title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.6,
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 4),
      ),
    );
  }
}
