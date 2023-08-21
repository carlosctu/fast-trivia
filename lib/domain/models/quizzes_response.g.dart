// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quizzes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizzesResponse _$QuizzesResponseFromJson(Map<String, dynamic> json) =>
    QuizzesResponse(
      quizzes: (json['questionarios'] as List<dynamic>)
          .map((e) => QuizzSection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuizzesResponseToJson(QuizzesResponse instance) =>
    <String, dynamic>{
      'questionarios': instance.quizzes,
    };
