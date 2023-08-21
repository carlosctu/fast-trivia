import 'package:fast_trivia/modules/home_page/bloc/home_bloc.dart';
import 'package:fast_trivia/modules/home_page/bloc/home_state.dart';
import 'package:fast_trivia/modules/quizz_page/quiz_page.dart';
import 'package:fast_trivia/utils/ui/export_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AvailableQuestionsTab extends StatelessWidget {
  const AvailableQuestionsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<HomeBloc>();
    return StreamBuilder(
        stream: bloc.stream,
        builder: (context, snapshot) {
          final state = snapshot.data?.status;

          switch (state) {
            case HomeStatus.complete:
              final quizzes = snapshot.data!.quizzes;

              return ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 1,
                    color: Colors.grey[350],
                  );
                },
                itemCount: quizzes.length,
                itemBuilder: (context, index) {
                  final quiz = quizzes[index];

                  return ActionRow(
                    title: Text(quiz.title),
                    subtitle: Text(
                      "Questões: ${quiz.questions.length}",
                    ),
                    onPressed: () => Navigator.pushNamed(
                      context,
                      QuizPage.route,
                      arguments: QuizPageArguments(
                        quizTitle: quiz.title,
                        quizSection: quiz,
                      ),
                    ),
                  );
                },
              );
            case HomeStatus.loading:
              return const Center(
                child: Text("Carregando..."),
              );
            case HomeStatus.error:
              return const Center(
                child: Text("Deu erro..."),
              );
            default:
              return Text("Error");
          }
        });
  }
}
