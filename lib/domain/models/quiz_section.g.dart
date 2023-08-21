// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizSection _$QuizSectionFromJson(Map<String, dynamic> json) => QuizSection(
      id: json['id'] as int,
      title: json['titulo'] as String,
      questions: (json['questoes'] as List<dynamic>)
          .map((e) => Questions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuizSectionToJson(QuizSection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titulo': instance.title,
      'questoes': instance.questions,
    };
