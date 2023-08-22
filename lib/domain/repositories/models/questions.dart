import 'package:json_annotation/json_annotation.dart';

part 'questions.g.dart';

@JsonSerializable()
class Questions {
  final int id;
  @JsonKey(name: "titulo")
  final String section;
  @JsonKey(name: "pergunta")
  final String title;
  @JsonKey(name: "gabarito")
  final int questionAnswer;
  @JsonKey(name: "alternativas")
  final List<QuestionAlternative> alternatives;

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
class QuestionAlternative {
  final int id;
  @JsonKey(name: "titulo")
  final String title;
  QuestionAlternative({
    required this.id,
    required this.title,
  });

  factory QuestionAlternative.fromJson(Map<String, dynamic> json) =>
      _$QuestionAlternativeFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionAlternativeToJson(this);
}
