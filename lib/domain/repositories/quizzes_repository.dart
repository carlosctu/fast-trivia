import 'package:fast_trivia/domain/repositories/mock/quizzes_mocked_data.dart';
import 'package:fast_trivia/domain/repositories/models/quizzes_response.dart';

class QuizzesRepository {
  Future<QuizzesResponse> getQuizzes() async {
    try {
      final result = await Future.delayed(
        const Duration(seconds: 1),
        () => QuizzesMockedData.data,
      );

      return QuizzesResponse.fromJson(result);
    } catch (ex) {
      throw Exception(ex);
    }
  }
}
