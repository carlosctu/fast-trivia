import 'package:fast_trivia/modules/quizz_page/bloc/quiz_bloc.dart';
import 'package:fast_trivia/modules/quizz_page/bloc/quiz_event.dart';
import 'package:fast_trivia/modules/quizz_page/widgets/quiz_alternatives.dart';
import 'package:flutter/material.dart';

import 'package:fast_trivia/domain/models/quiz_section.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizBody extends StatefulWidget {
  final QuizSection quizSection;
  const QuizBody({
    Key? key,
    required this.quizSection,
  }) : super(key: key);

  @override
  State<QuizBody> createState() => _QuizBodyState();
}

class _QuizBodyState extends State<QuizBody> {
  final controller = PageController(initialPage: 0);
  QuizBloc get bloc => context.read<QuizBloc>();

  @override
  void initState() {
    controller.addListener(() {
      // print(controller.page?.ceilToDouble());
      // print(widget.quizSection.questions.length);
      // print(controller.page?.ceilToDouble() ==
      // widget.quizSection.questions.length - 1);
      if (controller.page?.ceilToDouble() ==
          widget.quizSection.questions.length - 1) {
        bloc.add(QuizEventShouldShowSendQuizBtn());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final questions = widget.quizSection.questions;
    final maxHeight = MediaQuery.of(context).size.height;

    return PageView.builder(
      controller: controller,
      itemCount: questions.length,
      itemBuilder: (context, index) {
        final question = questions[index];
        final alternatives = questions[index].alternatives;
        return Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tópico: ${question.section}",
                ),
                Container(
                  height: maxHeight / 4,
                  color: Colors.white,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    question.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      height: 1.6,
                    ),
                  ),
                ),
                QuizAlternatives(
                  questionId: question.id,
                  alternatives: alternatives,
                  controller: controller,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
