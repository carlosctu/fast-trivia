import 'package:fast_trivia/modules/quizz_page/bloc/quiz_bloc.dart';
import 'package:fast_trivia/modules/quizz_page/bloc/quiz_event.dart';
import 'package:flutter/material.dart';

import 'package:fast_trivia/domain/models/questions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizAlternatives extends StatelessWidget {
  final int questionId;
  final List<QuestionAlternatives> alternatives;
  final PageController controller;
  const QuizAlternatives({
    Key? key,
    required this.questionId,
    required this.alternatives,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<QuizBloc>();
    final state = bloc.state;
    final userAnswers = state.userAnswers;

    return Expanded(
      child: ListView.separated(
        itemCount: alternatives.length,
        itemBuilder: (context, index) {
          final selectedAnswer =
              userAnswers.isNotEmpty ? userAnswers[questionId - 1] : 0;
          final alternative = alternatives[index];

          return Container(
            margin: const EdgeInsets.only(right: 8),
            child: InkWell(
              onTap: () {
                if (controller.page != userAnswers.length - 1) {
                  controller.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                }
                bloc.add(QuizEventUpdateUserAnswers(
                  questionId: questionId - 1,
                  answer: alternative.id,
                ));
              },
              child: Ink(
                padding: const EdgeInsets.all(20),
                color: selectedAnswer == alternative.id
                    ? Colors.green[100]
                    : Colors.grey[100],
                child: Text(
                  alternative.title,
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
