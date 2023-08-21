import 'package:fast_trivia/domain/models/quizz_section.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quizzes_response.g.dart';

@JsonSerializable()
class QuizzesResponse {
  @JsonKey(name: "questionarios")
  final List<QuizzSection> quizzes;
  QuizzesResponse({
    required this.quizzes,
  });

  factory QuizzesResponse.fromJson(Map<String, dynamic> json) =>
      _$QuizzesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$QuizzesResponseToJson(this);
}
