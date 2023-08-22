import 'package:fast_trivia/domain/repositories/models/history_quiz.dart';
import 'package:fast_trivia/modules/review_page/widgets/quiz_answers.dart';
import 'package:flutter/material.dart';

class ReviewBody extends StatefulWidget {
  final HistoryQuiz quizSection;
  const ReviewBody({
    Key? key,
    required this.quizSection,
  }) : super(key: key);

  @override
  State<ReviewBody> createState() => _ReviewBodyState();
}

class _ReviewBodyState extends State<ReviewBody> {
  final controller = PageController(initialPage: 0);

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
                QuizAnswers(
                  questionId: question.id,
                  quizSection: widget.quizSection,
                  controller: controller,
                  alternatives: alternatives,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
