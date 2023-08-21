import 'package:fast_trivia/domain/models/quizzes_response.dart';

class QuizzesRepository {
  // In case will use an API, uncomment the line behind and
  // import the Dio package into the file
  // final _dio = Dio();

  Future<QuizzesResponse> getQuizzes() async {
    try {
      // In case the data will come from an API, please
      // remove the two lines behind and comment the next two

      // final result = await _dio.get("add-data-end-point");
      // return QuestionsListResponse.fromJson(result.data);

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

class QuizzesMockedData {
  static const data = {
    "questionarios": [
      {
        "id": 1,
        "titulo": "Natureza brasileira",
        "questoes": [
          {
            "id": 1,
            "titulo": "Florestas brasileiras",
            "pergunta": "Qual o nome da maior floresta brasileira?",
            "gabarito": 4,
            "alternativas": [
              {"id": 1, "titulo": "Caatinga"},
              {"id": 2, "titulo": "Cerrado"},
              {"id": 3, "titulo": "Mata Atlântica"},
              {"id": 4, "titulo": "Amazônica"}
            ]
          },
          {
            "id": 2,
            "titulo": "Praias brasileiras",
            "pergunta": "Qual estado tem a maior faixa litorânea?",
            "gabarito": 3,
            "alternativas": [
              {"id": 1, "titulo": "São Paulo"},
              {"id": 2, "titulo": "Maranhão"},
              {"id": 3, "titulo": "Bahia"},
              {"id": 4, "titulo": "Rio de Janeiro"}
            ]
          },
          {
            "id": 3,
            "titulo": "Rios brasileiros",
            "pergunta": "Qual é o rio mais extenso do Brasil?",
            "gabarito": 1,
            "alternativas": [
              {"id": 1, "titulo": "Rio Amazonas"},
              {"id": 2, "titulo": "Rio São Francisco"},
              {"id": 3, "titulo": "Rio Paraná"},
              {"id": 4, "titulo": "Rio Tietê"}
            ]
          },
          {
            "id": 4,
            "titulo": "Biomas brasileiros",
            "pergunta": "Qual é o maior bioma do Brasil?",
            "gabarito": 2,
            "alternativas": [
              {"id": 1, "titulo": "Pantanal"},
              {"id": 2, "titulo": "Amazônia"},
              {"id": 3, "titulo": "Cerrado"},
              {"id": 4, "titulo": "Caatinga"}
            ]
          }
        ]
      },
      {
        "id": 2,
        "titulo": "Cidades do mundo",
        "questoes": [
          {
            "id": 1,
            "titulo": "Capitais europeias",
            "pergunta": "Qual é a capital da França?",
            "gabarito": 2,
            "alternativas": [
              {"id": 1, "titulo": "Londres"},
              {"id": 2, "titulo": "Paris"},
              {"id": 3, "titulo": "Berlim"},
              {"id": 4, "titulo": "Roma"}
            ]
          },
          {
            "id": 2,
            "titulo": "Cidades americanas",
            "pergunta": "Qual é a maior cidade dos Estados Unidos?",
            "gabarito": 1,
            "alternativas": [
              {"id": 1, "titulo": "Nova York"},
              {"id": 2, "titulo": "Los Angeles"},
              {"id": 3, "titulo": "Chicago"},
              {"id": 4, "titulo": "Miami"}
            ]
          },
          {
            "id": 3,
            "titulo": "Capitais asiáticas",
            "pergunta": "Qual é a capital do Japão?",
            "gabarito": 3,
            "alternativas": [
              {"id": 1, "titulo": "Pequim"},
              {"id": 2, "titulo": "Seul"},
              {"id": 3, "titulo": "Tóquio"},
              {"id": 4, "titulo": "Bangkok"}
            ]
          },
          {
            "id": 4,
            "titulo": "Capitais sul-americanas",
            "pergunta": "Qual é a capital da Argentina?",
            "gabarito": 4,
            "alternativas": [
              {"id": 1, "titulo": "Lima"},
              {"id": 2, "titulo": "Bogotá"},
              {"id": 3, "titulo": "Caracas"},
              {"id": 4, "titulo": "Buenos Aires"}
            ]
          },
          {
            "id": 5,
            "titulo": "Capitais africanas",
            "pergunta": "Qual é a capital da África do Sul?",
            "gabarito": 1,
            "alternativas": [
              {"id": 1, "titulo": "Cidade do Cabo"},
              {"id": 2, "titulo": "Joanesburgo"},
              {"id": 3, "titulo": "Pretória"},
              {"id": 4, "titulo": "Durban"}
            ]
          },
          {
            "id": 6,
            "titulo": "Capitais oceânicas",
            "pergunta": "Qual é a capital da Austrália?",
            "gabarito": 3,
            "alternativas": [
              {"id": 1, "titulo": "Sidney"},
              {"id": 2, "titulo": "Brisbane"},
              {"id": 3, "titulo": "Camberra"},
              {"id": 4, "titulo": "Melbourne"}
            ]
          }
        ]
      }
    ]
  };
}
