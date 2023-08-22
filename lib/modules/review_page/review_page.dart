import 'package:fast_trivia/domain/repositories/models/history_quiz.dart';
import 'package:fast_trivia/modules/review_page/widgets/review_body.dart';
import 'package:flutter/material.dart';

class ReviewPageArguments {
  final String quizTitle;
  final HistoryQuiz quizSection;
  ReviewPageArguments({
    required this.quizTitle,
    required this.quizSection,
  });
}

class ReviewPage extends StatefulWidget {
  final ReviewPageArguments args;
  const ReviewPage({
    Key? key,
    required this.args,
  }) : super(key: key);

  static const route = "/review";

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.only(
          top: 24,
          bottom: 12,
          left: 8,
        ),
        child: SafeArea(
          child: CustomScrollView(
            physics: const NeverScrollableScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                child: ReviewBody(
                  quizSection: widget.args.quizSection,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
