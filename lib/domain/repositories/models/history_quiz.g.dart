// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryQuiz _$HistoryQuizFromJson(Map<String, dynamic> json) => HistoryQuiz(
      id: json['id'] as int,
      title: json['title'] as String,
      questions: (json['questions'] as List<dynamic>)
          .map((e) => Questions.fromJson(e as Map<String, dynamic>))
          .toList(),
      answers: (json['answers'] as List<dynamic>).map((e) => e as int).toList(),
      userAnswers:
          (json['userAnswers'] as List<dynamic>).map((e) => e as int).toList(),
      score: json['score'] as num,
    );

Map<String, dynamic> _$HistoryQuizToJson(HistoryQuiz instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'questions': instance.questions,
      'answers': instance.answers,
      'userAnswers': instance.userAnswers,
      'score': instance.score,
    };

Questions _$QuestionsFromJson(Map<String, dynamic> json) => Questions(
      id: json['id'] as int,
      section: json['section'] as String,
      title: json['title'] as String,
      questionAnswer: json['questionAnswer'] as int,
      alternatives: (json['alternatives'] as List<dynamic>)
          .map((e) => QuestionAlternatives.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionsToJson(Questions instance) => <String, dynamic>{
      'id': instance.id,
      'section': instance.section,
      'title': instance.title,
      'questionAnswer': instance.questionAnswer,
      'alternatives': instance.alternatives,
    };

QuestionAlternatives _$QuestionAlternativesFromJson(
        Map<String, dynamic> json) =>
    QuestionAlternatives(
      id: json['id'] as int,
      title: json['title'] as String,
    );

Map<String, dynamic> _$QuestionAlternativesToJson(
        QuestionAlternatives instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
