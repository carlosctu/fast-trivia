import 'package:fast_trivia/data/datasource/history_quizzes_source.dart';
import 'package:fast_trivia/domain/repositories/quizzes_repository.dart';
import 'package:fast_trivia/domain/use_cases/get_history_use_case.dart';
import 'package:fast_trivia/domain/use_cases/get_quizzes_use_case.dart';
import 'package:fast_trivia/domain/use_cases/save_quizzes_on_history_use_case.dart';
import 'package:fast_trivia/modules/home_page/bloc/home_bloc.dart';
import 'package:fast_trivia/modules/quizz_page/bloc/quiz_bloc.dart';
import 'package:fast_trivia/modules/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'modules/home_page/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HistoryQuizzesSource.init();
  runApp(const FastTriviaApp());
}

class FastTriviaApp extends StatelessWidget {
  const FastTriviaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<QuizzesRepository>(
          create: (context) => QuizzesRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
            create: (context) => HomeBloc(
              GetQuizzesUseCase(
                context.read<QuizzesRepository>(),
              ),
              GetHistoryUseCase(),
            ),
          ),
          BlocProvider<QuizBloc>(
            create: (context) => QuizBloc(
              SaveQuizzesOnHistoryUseCase(),
            ),
          )
        ],
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: HomePage.route,
          onGenerateRoute: onGenerateRoute,
        ),
      ),
    );
  }
}
