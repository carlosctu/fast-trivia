import 'package:fast_trivia/domain/model/questions_view_data.dart';
import 'package:fast_trivia/domain/model/quiz_section_view_data.dart';
import 'package:fast_trivia/domain/repositories/models/questions.dart';
import 'package:fast_trivia/domain/repositories/models/quiz_section.dart';
import 'package:fast_trivia/modules/quizz_page/bloc/quiz_bloc.dart';
import 'package:fast_trivia/modules/quizz_page/bloc/quiz_event.dart';
import 'package:fast_trivia/modules/quizz_page/bloc/quiz_state.dart';
import 'package:fast_trivia/modules/quizz_page/widgets/quiz_body.dart';
import 'package:fast_trivia/modules/quizz_page/widgets/quiz_conclusion_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizPageArguments {
  final String quizTitle;
  final QuizSectionViewData quizSection;
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
  late List<QuestionsViewData> questions;

  @override
  void initState() {
    questions = widget.args.quizSection.questions;
    bloc.add(QuizEventCreateUserAnswers(
      questionsLength: questions.length,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<QuizBloc>().state;
    final double bottomPadding = widget.args.quizSection.questions.isEmpty
        ? 12
        : 20 + MediaQuery.of(context).viewPadding.bottom;
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<QuizBloc, QuizState>(
        builder: (context, _) {
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
              if (state.isQuizDone)
                QuizConclusionButton(
                  quizSection: widget.args.quizSection,
                )
            ],
          );
        },
      ),
    );
  }
}
