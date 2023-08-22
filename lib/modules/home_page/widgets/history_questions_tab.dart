import 'package:fast_trivia/modules/home_page/bloc/home_bloc.dart';
import 'package:fast_trivia/modules/home_page/bloc/home_event.dart';
import 'package:fast_trivia/modules/home_page/bloc/home_state.dart';
import 'package:fast_trivia/modules/home_page/widgets/empty_state_widget.dart';
import 'package:fast_trivia/modules/review_page/review_page.dart';
import 'package:fast_trivia/utils/ui/export_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryQuestionsTab extends StatefulWidget {
  const HistoryQuestionsTab({super.key});

  @override
  State<HistoryQuestionsTab> createState() => _HistoryQuestionsTabState();
}

class _HistoryQuestionsTabState extends State<HistoryQuestionsTab> {
  HomeBloc get bloc => context.read<HomeBloc>();

  @override
  void initState() {
    bloc.add(HomeEventFetchHistoryQuizzes());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<HomeBloc>();
    return StreamBuilder(
      stream: bloc.stream,
      builder: (context, snapshot) {
        final state = snapshot.data?.status;

        switch (state) {
          case HomeStatus.complete:
            final historyQuizzes = snapshot.data!.historyQuizzes;

            return ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
                return Divider(
                  height: 1,
                  color: Colors.grey[350],
                );
              },
              itemCount: historyQuizzes.length,
              itemBuilder: (context, index) {
                final quiz = historyQuizzes[index];

                return ActionRow(
                  title: Text(quiz.title),
                  subtitle: Text(
                    "Perguntas: ${quiz.questions.length}",
                  ),
                  rightContent: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Pontuação: ",
                      ),
                      Text(
                        "${quiz.score.toStringAsFixed(1)}%",
                        style: TextStyle(
                            color: quiz.score >= 50
                                ? Colors.green[600]
                                : Colors.red[600]),
                      )
                    ],
                  ),
                  onPressed: () => Navigator.pushNamed(
                    context,
                    ReviewPage.route,
                    arguments: ReviewPageArguments(
                      quizTitle: quiz.title,
                      quizSection: quiz,
                    ),
                  ),
                );
              },
            );
          case HomeStatus.empty:
            return const EmptyStateWidget(
              title: "Não há nenhum questionário",
              subtitle: "respondido por agora ):",
            );
          case HomeStatus.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case HomeStatus.error:
            return const Center(
              child: Text("Deu erro..."),
            );
          default:
            return const Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    );
  }
}
