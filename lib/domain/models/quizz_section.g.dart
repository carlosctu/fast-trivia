// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quizz_section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizzSection _$QuizzSectionFromJson(Map<String, dynamic> json) => QuizzSection(
      id: json['id'] as int,
      title: json['titulo'] as String,
      questions: (json['questoes'] as List<dynamic>)
          .map((e) => Questions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuizzSectionToJson(QuizzSection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titulo': instance.title,
      'questoes': instance.questions,
    };
