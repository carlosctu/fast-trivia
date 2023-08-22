import 'package:fast_trivia/domain/repositories/models/questions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quiz_section.g.dart';

@JsonSerializable()
class QuizSection {
  final int id;
  @JsonKey(name: "titulo")
  final String title;
  @JsonKey(name: "questoes")
  final List<Questions> questions;
  QuizSection({
    required this.id,
    required this.title,
    required this.questions,
  });

  factory QuizSection.fromJson(Map<String, dynamic> json) =>
      _$QuizSectionFromJson(json);
  Map<String, dynamic> toJson() => _$QuizSectionToJson(this);
}
