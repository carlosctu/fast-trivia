import 'package:fast_trivia/modules/home_page/home_page.dart';
import 'package:fast_trivia/modules/quizz_page/quiz_page.dart';
import 'package:flutter/material.dart';

Route<dynamic>? onGenerateRoute(settings) {
  if (settings.name == HomePage.route) {
    return MaterialPageRoute(
      builder: (BuildContext context) => const HomePage(),
    );
  } else if (settings.name == QuizPage.route) {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        final arguments = settings.arguments as QuizPageArguments;
        return QuizPage(args: arguments);
      },
    );
  }
  return null;
}
