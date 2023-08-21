import 'package:fast_trivia/modules/quizz_page/bloc/quiz_bloc.dart';
import 'package:fast_trivia/modules/quizz_page/bloc/quiz_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizConclusionButton extends StatelessWidget {
  const QuizConclusionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<QuizBloc, QuizState>(
      bloc: context.watch<QuizBloc>(),
      listener: (context, state) {
        print(state.isQuizDone);
        // TODO: implement listener
      },
      child: Positioned(
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
              showModalBottomSheet(
                context: context,
                builder: (context) {
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
                          const Text(
                            "Questões respondidas: 2/4",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 12,
                                  ),
                                  child: Text("Enviar"),
                                ),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 12,
                                  ),
                                  child: Text("Voltar"),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
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
      ),
    );
  }
}
