import 'package:json_annotation/json_annotation.dart';

part 'history_quiz.g.dart';

@JsonSerializable()
class HistoryQuiz {
  final int id;
  final String title;
  final List<Questions> questions;
  final List<int> answers;
  final List<int> userAnswers;
  final num score;
  HistoryQuiz({
    required this.id,
    required this.title,
    required this.questions,
    required this.answers,
    required this.userAnswers,
    required this.score,
  });

  factory HistoryQuiz.fromJson(Map<String, dynamic> json) =>
      _$HistoryQuizFromJson(json);
  Map<String, dynamic> toJson() => _$HistoryQuizToJson(this);
}

@JsonSerializable()
class Questions {
  final int id;
  final String section;
  final String title;
  final int questionAnswer;
  final List<QuestionAlternatives> alternatives;

  Questions({
    required this.id,
    required this.section,
    required this.title,
    required this.questionAnswer,
    required this.alternatives,
  });

  factory Questions.fromJson(Map<String, dynamic> json) =>
      _$QuestionsFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionsToJson(this);
}

@JsonSerializable()
class QuestionAlternatives {
  final int id;
  final String title;
  QuestionAlternatives({
    required this.id,
    required this.title,
  });

  factory QuestionAlternatives.fromJson(Map<String, dynamic> json) =>
      _$QuestionAlternativesFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionAlternativesToJson(this);
}
