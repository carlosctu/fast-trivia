// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Questions _$QuestionsFromJson(Map<String, dynamic> json) => Questions(
      id: json['id'] as int,
      section: json['titulo'] as String,
      title: json['pergunta'] as String,
      questionAnswer: json['gabarito'] as int,
      alternatives: (json['alternativas'] as List<dynamic>)
          .map((e) => QuestionAlternative.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionsToJson(Questions instance) => <String, dynamic>{
      'id': instance.id,
      'titulo': instance.section,
      'pergunta': instance.title,
      'gabarito': instance.questionAnswer,
      'alternativas': instance.alternatives,
    };

QuestionAlternative _$QuestionAlternativeFromJson(Map<String, dynamic> json) =>
    QuestionAlternative(
      id: json['id'] as int,
      title: json['titulo'] as String,
    );

Map<String, dynamic> _$QuestionAlternativeToJson(
        QuestionAlternative instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titulo': instance.title,
    };
