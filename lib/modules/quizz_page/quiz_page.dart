import 'package:fast_trivia/domain/models/quiz_section.dart';
import 'package:fast_trivia/modules/quizz_page/bloc/quiz_bloc.dart';
import 'package:fast_trivia/modules/quizz_page/bloc/quiz_event.dart';
import 'package:fast_trivia/modules/quizz_page/bloc/quiz_state.dart';
import 'package:fast_trivia/modules/quizz_page/widgets/quiz_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizPageArguments {
  final String quizTitle;
  final QuizSection quizSection;
  QuizPageArguments({
    required this.quizTitle,
    required this.quizSection,
  });
}

class QuizPage extends StatefulWidget {
  final QuizPageArguments args;
  const QuizPage({
    Key? key,
    required this.args,
  }) : super(key: key);

  static const route = "/quiz";

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizBloc get bloc => context.read<QuizBloc>();

  @override
  void initState() {
    final questions = widget.args.quizSection.questions;
    bloc.add(QuizEventCreateUserAnswers(
      questionsLength: questions.length,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double bottomPadding = widget.args.quizSection.questions.isEmpty
        ? 12
        : 20 + MediaQuery.of(context).viewPadding.bottom;
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<QuizBloc, QuizState>(
        builder: (context, state) {
          return Stack(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 24,
                  bottom: bottomPadding,
                  left: 8,
                ),
                child: SafeArea(
                  child: CustomScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    slivers: [
                      SliverFillRemaining(
                        child: QuizBody(
                          quizSection: widget.args.quizSection,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (bloc.state.isQuizDone) const _QuizConclusionButton()
            ],
          );
        },
      ),
    );
  }
}

class _QuizConclusionButton extends StatelessWidget {
  const _QuizConclusionButton();

  @override
  Widget build(BuildContext context) {
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
          onPressed: () {},
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
