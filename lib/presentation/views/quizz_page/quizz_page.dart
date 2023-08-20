import 'package:flutter/material.dart';

class QuestionSection {
  final int id;
  final String title;
  final String subtitle;
  final List<Answers> questions;
  QuestionSection({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.questions,
  });
}

class Answers {
  final int id;
  final String question;
  Answers({
    required this.id,
    required this.question,
  });
}

class MockedData {
  final data = [
    QuestionSection(
      id: 1,
      title: "Florestas brasileiras",
      subtitle: "Qual o nome da maior floresta brasileira?",
      questions: [
        Answers(
          id: 1,
          question: "Caatinga",
        ),
        Answers(
          id: 2,
          question: "Cerrado",
        ),
        Answers(
          id: 3,
          question: "Mata Atlântica",
        ),
        Answers(
          id: 4,
          question: "Amazônica",
        ),
      ],
    ),
    QuestionSection(
      id: 2,
      title: "Praias brasileiras",
      subtitle: "Qual o nome da maior floresta brasileira?",
      questions: [
        Answers(
          id: 1,
          question: "Caatinga",
        ),
        Answers(
          id: 2,
          question: "Cerrado",
        ),
        Answers(
          id: 3,
          question: "Mata Atlântica",
        ),
        Answers(
          id: 4,
          question: "Amazônica",
        ),
        Answers(
          id: 5,
          question: "Amazônica",
        ),
        Answers(
          id: 6,
          question: "Amazônica",
        ),
        Answers(
          id: 7,
          question: "Amazônica",
        ),
        Answers(
          id: 8,
          question: "Amazônica",
        ),
      ],
    ),
  ];
}

class QuizzPage extends StatefulWidget {
  const QuizzPage({super.key});

  @override
  State<QuizzPage> createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  final controller = PageController(initialPage: 0);
  late List<int> userAnswers;
  late List<QuestionSection> data;

  @override
  void initState() {
    print("initState");
    data = MockedData().data;
    userAnswers = List.generate(data.length, (_) => 0);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(userAnswers);
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;
    final double bottomPadding =
        data.isEmpty ? 12 : 20 + MediaQuery.of(context).viewPadding.bottom;
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
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
                    child: PageView.builder(
                      controller: controller,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final question = data[index];
                        final selectedAnswer = userAnswers[index];
                        return Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Tópico: ${question.title}",
                                ),
                                Container(
                                  height: maxHeight / 4,
                                  color: Colors.white,
                                  alignment: AlignmentDirectional.center,
                                  child: Text(
                                    question.subtitle,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      height: 1.6,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListView.separated(
                                    itemBuilder: (context, index) {
                                      final answer = question.questions[index];
                                      return Container(
                                        margin: const EdgeInsets.only(right: 8),
                                        child: InkWell(
                                          onTap: () {
                                            userAnswers[question.id - 1] =
                                                answer.id;
                                            setState(() {});
                                          },
                                          child: Ink(
                                            padding: const EdgeInsets.all(20),
                                            color: selectedAnswer == answer.id
                                                ? Colors.green[100]
                                                : Colors.grey[100],
                                            child: Text(
                                              answer.question,
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
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(height: 4),
                                    itemCount: question.questions.length,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const _QuizzConclusionButton()
        ],
      ),
    );
  }
}

class _QuizzConclusionButton extends StatelessWidget {
  const _QuizzConclusionButton();

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
