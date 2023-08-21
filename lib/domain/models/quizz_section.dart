import 'package:fast_trivia/domain/models/questions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quizz_section.g.dart';

@JsonSerializable()
class QuizzSection {
  final int id;
  @JsonKey(name: "titulo")
  final String title;
  @JsonKey(name: "questoes")
  final List<Questions> questions;
  QuizzSection({
    required this.id,
    required this.title,
    required this.questions,
  });

  factory QuizzSection.fromJson(Map<String, dynamic> json) =>
      _$QuizzSectionFromJson(json);
  Map<String, dynamic> toJson() => _$QuizzSectionToJson(this);
}
