import 'package:fast_trivia/domain/repositories/quizzes_repository.dart';
import 'package:fast_trivia/modules/home_page/bloc/home_bloc.dart';
import 'package:fast_trivia/modules/quizz_page/bloc/quiz_bloc.dart';
import 'package:fast_trivia/modules/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'modules/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
              context.read<QuizzesRepository>(),
            ),
          ),
          BlocProvider<QuizBloc>(
            create: (context) => QuizBloc(),
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
