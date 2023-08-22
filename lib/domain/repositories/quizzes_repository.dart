import 'package:fast_trivia/domain/repositories/models/quizzes_response.dart';

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
      },
      {
        "id": 3,
        "titulo": "Animais Selvagens",
        "questoes": [
          {
            "id": 1,
            "titulo": "Grandes Felinos",
            "pergunta": "Qual é o maior felino do mundo?",
            "gabarito": 3,
            "alternativas": [
              {"id": 1, "titulo": "Leão"},
              {"id": 2, "titulo": "Leopardo"},
              {"id": 3, "titulo": "Tigre"},
              {"id": 4, "titulo": "Guepardo"}
            ]
          },
          {
            "id": 2,
            "titulo": "Mamíferos Aquáticos",
            "pergunta": "Qual é o maior mamífero marinho?",
            "gabarito": 2,
            "alternativas": [
              {"id": 1, "titulo": "Golfinho"},
              {"id": 2, "titulo": "Baleia Azul"},
              {"id": 3, "titulo": "Orca"},
              {"id": 4, "titulo": "Foca"}
            ]
          },
          {
            "id": 3,
            "titulo": "Aves de Rapina",
            "pergunta": "Qual é a maior ave de rapina do mundo?",
            "gabarito": 1,
            "alternativas": [
              {"id": 1, "titulo": "Águia Real"},
              {"id": 2, "titulo": "Falcão Peregrino"},
              {"id": 3, "titulo": "Coruja Buraqueira"},
              {"id": 4, "titulo": "Abutre"}
            ]
          },
          {
            "id": 4,
            "titulo": "Répteis Venenosos",
            "pergunta": "Qual é a cobra mais venenosa do planeta?",
            "gabarito": 4,
            "alternativas": [
              {"id": 1, "titulo": "Naja"},
              {"id": 2, "titulo": "Cascavel"},
              {"id": 3, "titulo": "Jararaca"},
              {"id": 4, "titulo": "Taipan do Interior"}
            ]
          },
          {
            "id": 5,
            "titulo": "Animais Africanos",
            "pergunta": "Qual é o maior mamífero terrestre?",
            "gabarito": 1,
            "alternativas": [
              {"id": 1, "titulo": "Elefante Africano"},
              {"id": 2, "titulo": "Rinoceronte Branco"},
              {"id": 3, "titulo": "Hipopótamo"},
              {"id": 4, "titulo": "Girafa"}
            ]
          },
          {
            "id": 6,
            "titulo": "Animais Amazônicos",
            "pergunta": "Qual é o maior réptil da Amazônia?",
            "gabarito": 2,
            "alternativas": [
              {"id": 1, "titulo": "Iguana"},
              {"id": 2, "titulo": "Jacaré-Açu"},
              {"id": 3, "titulo": "Sucuri"},
              {"id": 4, "titulo": "Tartaruga da Amazônia"}
            ]
          }
        ]
      },
      {
        "id": 4,
        "titulo": "História Mundial",
        "questoes": [
          {
            "id": 1,
            "titulo": "Grande Império",
            "pergunta":
                "Qual foi o império que governou grande parte da Europa, Ásia e África durante a antiguidade?",
            "gabarito": 3,
            "alternativas": [
              {"id": 1, "titulo": "Império Romano"},
              {"id": 2, "titulo": "Império Persa"},
              {"id": 3, "titulo": "Império Mongol"},
              {"id": 4, "titulo": "Império Bizantino"}
            ]
          },
          {
            "id": 2,
            "titulo": "Idade Moderna",
            "pergunta": "Qual evento marcou o início da Idade Moderna?",
            "gabarito": 1,
            "alternativas": [
              {"id": 1, "titulo": "Queda de Constantinopla"},
              {"id": 2, "titulo": "Revolução Industrial"},
              {"id": 3, "titulo": "Guerra Fria"},
              {"id": 4, "titulo": "Revolução Francesa"}
            ]
          },
          {
            "id": 3,
            "titulo": "Revolução Americana",
            "pergunta":
                "Qual foi o documento que declarou a independência das Treze Colônias Americanas?",
            "gabarito": 2,
            "alternativas": [
              {"id": 1, "titulo": "Tratado de Versalhes"},
              {"id": 2, "titulo": "Declaração de Independência"},
              {"id": 3, "titulo": "Carta Magna"},
              {"id": 4, "titulo": "Constituição dos Estados Unidos"}
            ]
          },
          {
            "id": 4,
            "titulo": "Revolução Russa",
            "pergunta": "Qual líder liderou a Revolução Russa de 1917?",
            "gabarito": 4,
            "alternativas": [
              {"id": 1, "titulo": "Czar Nicolau II"},
              {"id": 2, "titulo": "Grigori Rasputin"},
              {"id": 3, "titulo": "Lev Tolstói"},
              {"id": 4, "titulo": "Vladimir Lênin"}
            ]
          },
          {
            "id": 5,
            "titulo": "Segunda Guerra Mundial",
            "pergunta":
                "Qual foi o país que sofreu os bombardeios nucleares em Hiroshima e Nagasaki?",
            "gabarito": 3,
            "alternativas": [
              {"id": 1, "titulo": "Alemanha"},
              {"id": 2, "titulo": "Itália"},
              {"id": 3, "titulo": "Japão"},
              {"id": 4, "titulo": "União Soviética"}
            ]
          },
          {
            "id": 6,
            "titulo": "Guerra Fria",
            "pergunta":
                "Qual foi o nome da política adotada pelos Estados Unidos para conter a expansão do comunismo?",
            "gabarito": 2,
            "alternativas": [
              {"id": 1, "titulo": "Doutrina Truman"},
              {"id": 2, "titulo": "Détente"},
              {"id": 3, "titulo": "Plano Marshall"},
              {"id": 4, "titulo": "Perestroika"}
            ]
          }
        ]
      },
      {
        "id": 5,
        "titulo": "Ciência e Tecnologia",
        "questoes": [
          {
            "id": 1,
            "titulo": "Descobertas Científicas",
            "pergunta":
                "Quem é conhecido por suas leis do movimento e gravitação?",
            "gabarito": 2,
            "alternativas": [
              {"id": 1, "titulo": "Nikola Tesla"},
              {"id": 2, "titulo": "Isaac Newton"},
              {"id": 3, "titulo": "Albert Einstein"},
              {"id": 4, "titulo": "Galileu Galilei"}
            ]
          },
          {
            "id": 2,
            "titulo": "Avanços Tecnológicos",
            "pergunta": "Qual invenção é atribuída a Thomas Edison?",
            "gabarito": 1,
            "alternativas": [
              {"id": 1, "titulo": "Lâmpada Incandescente"},
              {"id": 2, "titulo": "Telefone"},
              {"id": 3, "titulo": "Avião"},
              {"id": 4, "titulo": "Máquina a Vapor"}
            ]
          },
          {
            "id": 3,
            "titulo": "Descobertas Médicas",
            "pergunta": "Quem desenvolveu a primeira vacina contra a raiva?",
            "gabarito": 3,
            "alternativas": [
              {"id": 1, "titulo": "Louis Pasteur"},
              {"id": 2, "titulo": "Marie Curie"},
              {"id": 3, "titulo": "Edward Jenner"},
              {"id": 4, "titulo": "Alexander Fleming"}
            ]
          },
          {
            "id": 4,
            "titulo": "Exploração Espacial",
            "pergunta": "Qual foi a primeira missão tripulada a pousar na Lua?",
            "gabarito": 4,
            "alternativas": [
              {"id": 1, "titulo": "Apollo 11"},
              {"id": 2, "titulo": "Sputnik 1"},
              {"id": 3, "titulo": "Challenger"},
              {"id": 4, "titulo": "Apollo 8"}
            ]
          },
          {
            "id": 5,
            "titulo": "Inovações Digitais",
            "pergunta":
                "Qual é a empresa responsável pelo desenvolvimento do sistema operacional Windows?",
            "gabarito": 1,
            "alternativas": [
              {"id": 1, "titulo": "Microsoft"},
              {"id": 2, "titulo": "Apple"},
              {"id": 3, "titulo": "Google"},
              {"id": 4, "titulo": "IBM"}
            ]
          },
          {
            "id": 6,
            "titulo": "Genética",
            "pergunta":
                "Quem é conhecido por suas pesquisas pioneiras sobre a estrutura do DNA?",
            "gabarito": 2,
            "alternativas": [
              {"id": 1, "titulo": "Marie Curie"},
              {"id": 2, "titulo": "James Watson"},
              {"id": 3, "titulo": "Albert Einstein"},
              {"id": 4, "titulo": "Isaac Newton"}
            ]
          }
        ]
      },
      {
        "id": 6,
        "titulo": "Cultura Pop",
        "questoes": [
          {
            "id": 1,
            "titulo": "Cinema",
            "pergunta": "Qual filme ganhou o Oscar de Melhor Filme em 2020?",
            "gabarito": 3,
            "alternativas": [
              {"id": 1, "titulo": "1917"},
              {"id": 2, "titulo": "Parasita"},
              {"id": 3, "titulo": "Coringa"},
              {"id": 4, "titulo": "Era Uma Vez em Hollywood"}
            ]
          },
          {
            "id": 2,
            "titulo": "Música",
            "pergunta": "Qual artista é conhecido como o 'Rei do Pop'?",
            "gabarito": 1,
            "alternativas": [
              {"id": 1, "titulo": "Michael Jackson"},
              {"id": 2, "titulo": "Elvis Presley"},
              {"id": 3, "titulo": "David Bowie"},
              {"id": 4, "titulo": "Prince"}
            ]
          },
          {
            "id": 3,
            "titulo": "Televisão",
            "pergunta":
                "Qual série de televisão é baseada nas Crônicas de Gelo e Fogo, de George R. R. Martin?",
            "gabarito": 4,
            "alternativas": [
              {"id": 1, "titulo": "The Walking Dead"},
              {"id": 2, "titulo": "Stranger Things"},
              {"id": 3, "titulo": "Breaking Bad"},
              {"id": 4, "titulo": "Game of Thrones"}
            ]
          },
          {
            "id": 4,
            "titulo": "Literatura",
            "pergunta":
                "Qual é o primeiro livro da série 'Harry Potter', de J.K. Rowling?",
            "gabarito": 2,
            "alternativas": [
              {"id": 1, "titulo": "Harry Potter e a Câmara Secreta"},
              {"id": 2, "titulo": "Harry Potter e a Pedra Filosofal"},
              {"id": 3, "titulo": "Harry Potter e o Cálice de Fogo"},
              {"id": 4, "titulo": "Harry Potter e a Ordem da Fênix"}
            ]
          },
          {
            "id": 5,
            "titulo": "Video Games",
            "pergunta":
                "Qual é o jogo eletrônico mais vendido de todos os tempos?",
            "gabarito": 3,
            "alternativas": [
              {"id": 1, "titulo": "Grand Theft Auto V"},
              {"id": 2, "titulo": "Minecraft"},
              {"id": 3, "titulo": "Tetris"},
              {"id": 4, "titulo": "Super Mario Bros."}
            ]
          },
          {
            "id": 6,
            "titulo": "Arte",
            "pergunta":
                "Qual pintor é famoso por suas obras de arte surrealistas, incluindo 'A Persistência da Memória'?",
            "gabarito": 4,
            "alternativas": [
              {"id": 1, "titulo": "Leonardo da Vinci"},
              {"id": 2, "titulo": "Vincent van Gogh"},
              {"id": 3, "titulo": "Pablo Picasso"},
              {"id": 4, "titulo": "Salvador Dalí"}
            ]
          }
        ]
      },
      {
        "id": 7,
        "titulo": "Geografia Mundial",
        "questoes": [
          {
            "id": 1,
            "titulo": "Países da Europa",
            "pergunta": "Qual país é conhecido como 'Terra dos Vikings'?",
            "gabarito": 2,
            "alternativas": [
              {"id": 1, "titulo": "Suécia"},
              {"id": 2, "titulo": "Noruega"},
              {"id": 3, "titulo": "Dinamarca"},
              {"id": 4, "titulo": "Finlândia"}
            ]
          },
          {
            "id": 2,
            "titulo": "Rios do Mundo",
            "pergunta": "Qual é o rio mais longo do mundo?",
            "gabarito": 1,
            "alternativas": [
              {"id": 1, "titulo": "Rio Amazonas"},
              {"id": 2, "titulo": "Rio Nilo"},
              {"id": 3, "titulo": "Rio Yangtzé"},
              {"id": 4, "titulo": "Rio Mississippi"}
            ]
          },
          {
            "id": 3,
            "titulo": "Montanhas Famosas",
            "pergunta": "Qual é a montanha mais alta do mundo?",
            "gabarito": 2,
            "alternativas": [
              {"id": 1, "titulo": "Monte Kilimanjaro"},
              {"id": 2, "titulo": "Monte Everest"},
              {"id": 3, "titulo": "Monte Aconcágua"},
              {"id": 4, "titulo": "Monte Fuji"}
            ]
          },
          {
            "id": 4,
            "titulo": "Capitais do Oriente Médio",
            "pergunta": "Qual é a capital da Turquia?",
            "gabarito": 3,
            "alternativas": [
              {"id": 1, "titulo": "Dubai"},
              {"id": 2, "titulo": "Teerã"},
              {"id": 3, "titulo": "Ancara"},
              {"id": 4, "titulo": "Bagdá"}
            ]
          }
        ]
      },
      {
        "id": 8,
        "titulo": "Literatura Clássica",
        "questoes": [
          {
            "id": 1,
            "titulo": "Autores Famosos",
            "pergunta": "Quem escreveu 'Dom Quixote'?",
            "gabarito": 4,
            "alternativas": [
              {"id": 1, "titulo": "William Shakespeare"},
              {"id": 2, "titulo": "Jane Austen"},
              {"id": 3, "titulo": "Charles Dickens"},
              {"id": 4, "titulo": "Miguel de Cervantes"}
            ]
          },
          {
            "id": 2,
            "titulo": "Romances Clássicos",
            "pergunta":
                "Qual romance é conhecido por sua abertura 'É uma verdade universalmente reconhecida que um homem solteiro, possuidor de uma boa fortuna, deve estar necessitado de esposa.'?",
            "gabarito": 1,
            "alternativas": [
              {"id": 1, "titulo": "Orgulho e Preconceito"},
              {"id": 2, "titulo": "O Morro dos Ventos Uivantes"},
              {"id": 3, "titulo": "Mansfield Park"},
              {"id": 4, "titulo": "Cidade das Cinzas"}
            ]
          },
          {
            "id": 3,
            "titulo": "Poesia Clássica",
            "pergunta":
                "Qual poema épico narra a jornada de Ulisses (Odisseu) de volta para casa após a Guerra de Troia?",
            "gabarito": 3,
            "alternativas": [
              {"id": 1, "titulo": "A Divina Comédia"},
              {"id": 2, "titulo": "Paraíso Perdido"},
              {"id": 3, "titulo": "A Odisseia"},
              {"id": 4, "titulo": "O Paraíso Conquistado"}
            ]
          },
          {
            "id": 4,
            "titulo": "Dramaturgos Renomados",
            "pergunta": "Quem é o autor de 'Romeu e Julieta'?",
            "gabarito": 2,
            "alternativas": [
              {"id": 1, "titulo": "George Bernard Shaw"},
              {"id": 2, "titulo": "William Shakespeare"},
              {"id": 3, "titulo": "Anton Tchekhov"},
              {"id": 4, "titulo": "Henrik Ibsen"}
            ]
          }
        ]
      },
      {
        "id": 9,
        "titulo": "Música",
        "questoes": [
          {
            "id": 1,
            "titulo": "Gêneros Musicais",
            "pergunta":
                "Qual gênero musical originou-se nos Estados Unidos, apresentando vocais rítmicos e rimados?",
            "gabarito": 3,
            "alternativas": [
              {"id": 1, "titulo": "Samba"},
              {"id": 2, "titulo": "Country"},
              {"id": 3, "titulo": "Hip Hop"},
              {"id": 4, "titulo": "Jazz"}
            ]
          },
          {
            "id": 2,
            "titulo": "Grandes Artistas",
            "pergunta": "Qual artista é conhecido como 'Rei do Pop'?",
            "gabarito": 1,
            "alternativas": [
              {"id": 1, "titulo": "Michael Jackson"},
              {"id": 2, "titulo": "Elvis Presley"},
              {"id": 3, "titulo": "David Bowie"},
              {"id": 4, "titulo": "Prince"}
            ]
          },
          {
            "id": 3,
            "titulo": "Bandas Famosas",
            "pergunta":
                "Qual banda britânica é famosa por sucessos como 'Bohemian Rhapsody' e 'We Will Rock You'?",
            "gabarito": 4,
            "alternativas": [
              {"id": 1, "titulo": "The Rolling Stones"},
              {"id": 2, "titulo": "The Beatles"},
              {"id": 3, "titulo": "Led Zeppelin"},
              {"id": 4, "titulo": "Queen"}
            ]
          },
          {
            "id": 4,
            "titulo": "Instrumentos Musicais",
            "pergunta":
                "Qual instrumento musical de cordas é conhecido por sua sonoridade suave e é amplamente usado na música clássica?",
            "gabarito": 2,
            "alternativas": [
              {"id": 1, "titulo": "Trompete"},
              {"id": 2, "titulo": "Violino"},
              {"id": 3, "titulo": "Flauta"},
              {"id": 4, "titulo": "Bateria"}
            ]
          }
        ]
      },
      {
        "id": 10,
        "titulo": "Tecnologia",
        "questoes": [
          {
            "id": 1,
            "titulo": "Grandes Invenções",
            "pergunta": "Qual invenção é creditada a Tim Berners-Lee?",
            "gabarito": 3,
            "alternativas": [
              {"id": 1, "titulo": "Telefone"},
              {"id": 2, "titulo": "Lâmpada Incandescente"},
              {"id": 3, "titulo": "World Wide Web"},
              {"id": 4, "titulo": "Avião"}
            ]
          },
          {
            "id": 2,
            "titulo": "Empresas de Tecnologia",
            "pergunta":
                "Qual empresa é conhecida por seus sistemas operacionais Windows?",
            "gabarito": 1,
            "alternativas": [
              {"id": 1, "titulo": "Microsoft"},
              {"id": 2, "titulo": "Apple"},
              {"id": 3, "titulo": "Google"},
              {"id": 4, "titulo": "IBM"}
            ]
          },
          {
            "id": 3,
            "titulo": "Inovações Digitais",
            "pergunta": "Qual foi o primeiro smartphone lançado pela Apple?",
            "gabarito": 2,
            "alternativas": [
              {"id": 1, "titulo": "iPhone 3G"},
              {"id": 2, "titulo": "iPhone"},
              {"id": 3, "titulo": "iPhone 4"},
              {"id": 4, "titulo": "iPhone 5"}
            ]
          },
          {
            "id": 4,
            "titulo": "Avanços Tecnológicos",
            "pergunta":
                "Qual é a tecnologia de comunicação sem fio que permite a transferência de dados de curta distância?",
            "gabarito": 4,
            "alternativas": [
              {"id": 1, "titulo": "Bluetooth"},
              {"id": 2, "titulo": "Wi-Fi"},
              {"id": 3, "titulo": "NFC"},
              {"id": 4, "titulo": "Radiofrequência"}
            ]
          }
        ]
      },
      {
        "id": 11,
        "titulo": "Gastronomia",
        "questoes": [
          {
            "id": 1,
            "titulo": "Culinária Internacional",
            "pergunta":
                "Qual prato é originário da Itália e é feito com camadas de massa intercaladas com molho de tomate, queijo e outros ingredientes?",
            "gabarito": 3,
            "alternativas": [
              {"id": 1, "titulo": "Sushi"},
              {"id": 2, "titulo": "Taco"},
              {"id": 3, "titulo": "Lasanha"},
              {"id": 4, "titulo": "Pad Thai"},
              {"id": 5, "titulo": "Biryani"},
              {"id": 6, "titulo": "Croissant"}
            ]
          },
          {
            "id": 2,
            "titulo": "Especiarias",
            "pergunta":
                "Qual especiaria é conhecida como 'o ouro vermelho' devido à sua cor e valor histórico?",
            "gabarito": 4,
            "alternativas": [
              {"id": 1, "titulo": "Pimenta-do-reino"},
              {"id": 2, "titulo": "Noz-moscada"},
              {"id": 3, "titulo": "Canela"},
              {"id": 4, "titulo": "Açafrão"},
              {"id": 5, "titulo": "Cominho"},
              {"id": 6, "titulo": "Cúrcuma"}
            ]
          },
          {
            "id": 3,
            "titulo": "Culinária Oriental",
            "pergunta":
                "Qual prato japonês é feito de arroz temperado com vinagre, açúcar e sal, frequentemente combinado com peixe cru e legumes?",
            "gabarito": 1,
            "alternativas": [
              {"id": 1, "titulo": "Sushi"},
              {"id": 2, "titulo": "Tofu"},
              {"id": 3, "titulo": "Dim Sum"},
              {"id": 4, "titulo": "Pho"},
              {"id": 5, "titulo": "Bibimbap"},
              {"id": 6, "titulo": "Pad Thai"}
            ]
          },
          {
            "id": 4,
            "titulo": "Doces Tradicionais",
            "pergunta":
                "Qual é o doce típico do Brasil feito de leite condensado, chocolate em pó e manteiga?",
            "gabarito": 2,
            "alternativas": [
              {"id": 1, "titulo": "Churros"},
              {"id": 2, "titulo": "Brigadeiro"},
              {"id": 3, "titulo": "Gulab Jamun"},
              {"id": 4, "titulo": "Tiramisu"},
              {"id": 5, "titulo": "Mochi"},
              {"id": 6, "titulo": "Baklava"}
            ]
          },
          {
            "id": 5,
            "titulo": "Pratos Típicos",
            "pergunta":
                "Qual é o prato tradicional da Índia feito com lentilhas, temperos e servido com arroz?",
            "gabarito": 3,
            "alternativas": [
              {"id": 1, "titulo": "Fish and Chips"},
              {"id": 2, "titulo": "Taco"},
              {"id": 3, "titulo": "Dal Bhat"},
              {"id": 4, "titulo": "Poutine"},
              {"id": 5, "titulo": "Sushi"},
              {"id": 6, "titulo": "Ceviche"}
            ]
          },
          {
            "id": 6,
            "titulo": "Bebidas Tradicionais",
            "pergunta":
                "Qual bebida alcoólica é feita a partir da destilação de uvas e é associada à região da Champagne, na França?",
            "gabarito": 4,
            "alternativas": [
              {"id": 1, "titulo": "Cerveja"},
              {"id": 2, "titulo": "Whisky"},
              {"id": 3, "titulo": "Tequila"},
              {"id": 4, "titulo": "Champanhe"},
              {"id": 5, "titulo": "Vodka"},
              {"id": 6, "titulo": "Sake"}
            ]
          }
        ]
      },
      {
        "id": 12,
        "titulo": "Filmes Clássicos",
        "questoes": [
          {
            "id": 1,
            "titulo": "Cinema Noir",
            "pergunta":
                "Qual filme de 1941, dirigido por Orson Welles, é famoso por sua abertura 'Rosebud'?",
            "gabarito": 1,
            "alternativas": [
              {"id": 1, "titulo": "Cidadão Kane"},
              {"id": 2, "titulo": "Casablanca"},
              {"id": 3, "titulo": "O Falcão Maltês"},
              {"id": 4, "titulo": "No Silêncio da Noite"},
              {"id": 5, "titulo": "Os Suspeitos"},
              {"id": 6, "titulo": "A Dama de Shangai"}
            ]
          },
          {
            "id": 2,
            "titulo": "Clássicos do Terror",
            "pergunta":
                "Qual filme de 1960, dirigido por Alfred Hitchcock, apresenta a cena do chuveiro?",
            "gabarito": 3,
            "alternativas": [
              {"id": 1, "titulo": "Drácula"},
              {"id": 2, "titulo": "A Noite dos Mortos-Vivos"},
              {"id": 3, "titulo": "Psicose"},
              {"id": 4, "titulo": "O Exorcista"},
              {"id": 5, "titulo": "O Bebê de Rosemary"},
              {"id": 6, "titulo": "O Iluminado"}
            ]
          },
          {
            "id": 3,
            "titulo": "Épicos Históricos",
            "pergunta":
                "Qual filme de 1959, dirigido por William Wyler, é uma adaptação da história bíblica de Ben-Hur?",
            "gabarito": 4,
            "alternativas": [
              {"id": 1, "titulo": "Cleópatra"},
              {"id": 2, "titulo": "Alexandre"},
              {"id": 3, "titulo": "Gladiador"},
              {"id": 4, "titulo": "Ben-Hur"},
              {"id": 5, "titulo": "O Último dos Moicanos"},
              {"id": 6, "titulo": "Espártaco"}
            ]
          },
          {
            "id": 4,
            "titulo": "Comédias Clássicas",
            "pergunta":
                "Qual filme de 1936, estrelado pelos irmãos Marx, é conhecido por sua trama caótica em um hotel?",
            "gabarito": 2,
            "alternativas": [
              {"id": 1, "titulo": "Quanto Mais Quente Melhor"},
              {"id": 2, "titulo": "Uma Noite na Ópera"},
              {"id": 3, "titulo": "O Grande Ditador"},
              {"id": 4, "titulo": "Tempos Modernos"},
              {"id": 5, "titulo": "O Picolino"},
              {"id": 6, "titulo": "Jejum de Amor"}
            ]
          },
          {
            "id": 5,
            "titulo": "Dramas Intensos",
            "pergunta":
                "Qual filme de 1994, dirigido por Frank Darabont, é baseado em um conto de Stephen King e se passa em uma prisão?",
            "gabarito": 3,
            "alternativas": [
              {"id": 1, "titulo": "A Lista de Schindler"},
              {"id": 2, "titulo": "O Poderoso Chefão"},
              {"id": 3, "titulo": "Um Sonho de Liberdade"},
              {"id": 4, "titulo": "Clube da Luta"},
              {"id": 5, "titulo": "Beleza Americana"},
              {"id": 6, "titulo": "O Sexto Sentido"}
            ]
          },
          {
            "id": 6,
            "titulo": "Romances Inesquecíveis",
            "pergunta":
                "Qual filme de 1997, dirigido por James Cameron, é um épico romântico que se passa durante o naufrágio do RMS Titanic?",
            "gabarito": 1,
            "alternativas": [
              {"id": 1, "titulo": "Titanic"},
              {"id": 2, "titulo": "E o Vento Levou"},
              {"id": 3, "titulo": "Amor Além da Vida"},
              {"id": 4, "titulo": "Orgulho e Preconceito"},
              {"id": 5, "titulo": "Casablanca"},
              {"id": 6, "titulo": "Diário de uma Paixão"}
            ]
          }
        ]
      }
    ]
  };
}
