import 'package:fast_trivia/domain/model/quiz_section_view_data.dart';
import 'package:fast_trivia/modules/quizz_page/bloc/quiz_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fast_trivia/modules/conclusion_page/conclusion_page.dart';
import 'package:fast_trivia/modules/quizz_page/bloc/quiz_bloc.dart';
import 'package:fast_trivia/utils/ui/export_widgets.dart';

class QuizConclusionButton extends StatelessWidget {
  final QuizSectionViewData quizSection;
  const QuizConclusionButton({
    Key? key,
    required this.quizSection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<QuizBloc>();
    final state = bloc.state;

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.only(
          top: 8,
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewPadding.bottom,
        ),
        color: Colors.white,
        child: TextButton(
          onPressed: () {
            bloc.add(QuizEventCompleteQuiz(
              quizAnswers: quizSection.answers,
              userAnswers: state.userAnswers,
              quiz: quizSection,
            ));
            showModalBottomSheet(
              context: context,
              builder: (context) => _CompleteQuizBottomSheet(
                questionLength: quizSection.questions.length,
                quizAnswers: quizSection.answers,
              ),
            );
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Finalizar",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class _CompleteQuizBottomSheet extends StatelessWidget {
  final int questionLength;
  final List<int> quizAnswers;
  const _CompleteQuizBottomSheet({
    Key? key,
    required this.questionLength,
    required this.quizAnswers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<QuizBloc>();
    final state = bloc.state;
    final answeredQuestions =
        state.userAnswers.where((answer) => answer != 0).length;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          runSpacing: 12,
          // mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Enviar questionario",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "Uma vez que o questionario for enviado, não se poderam alterar as respostas.",
              style: TextStyle(
                fontSize: 14,
                height: 1.2,
                color: Colors.grey[700],
              ),
            ),
            Text(
              "Questões respondidas: $answeredQuestions/$questionLength",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ButtonContainer(
                  label: Text("Enviar"),
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    ConclusionPage.route,
                    (route) => false,
                    arguments: ConclusionArguments(score: state.score),
                  ),
                  isButtonColored: true,
                ),
                const SizedBox(width: 4),
                ButtonContainer(
                  label: Text("Voltar"),
                  onPressed: () => Navigator.pop(context),
                  isButtonColored: false,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
