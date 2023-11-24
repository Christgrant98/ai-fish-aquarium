import 'package:login_flutter/src/models/trivia.dart';

class TriviaGameData {
  List<TriviaGame> questions = <TriviaGame>[
    TriviaGame(
      id: 0,
      question:
          '¿En qué tipo de hábitat acuático se encuentra comúnmente la anguila?',
      answers: {
        0: 'Océano Atlántico',
        1: 'Agua salada de mar',
        2: 'Ríos y lagos de agua dulce (Correcta)',
        3: 'Estuarios de agua salobre',
      },
      imagePath: 'assets/carousel/electric_eel.jpg',
      pointsValue: 1000,
    ),
    TriviaGame(
      id: 1,
      question:
          '¿Dónde suele encontrarse el sabalote, un pez de gran tamaño y cuerpo plateado?',
      answers: {
        0: 'Aguas dulces de lagos y embalses',
        1: 'Estuarios y desembocaduras de ríos (Correcta)',
        2: 'Fondo del océano en aguas profundas',
        3: 'Arrecifes de coral en aguas saladas',
      },
      imagePath: 'assets/carousel/mexican_cavefish.jpg',
      pointsValue: 1100,
    ),
    TriviaGame(
      id: 2,
      question:
          '¿Cuál es la edad máxima que puede alcanzar un pez dorado (Carassius auratus) en condiciones ideales de cuidado?',
      answers: {
        0: '5 años',
        1: '15 años',
        2: '25 años (Correcta)',
        3: '40 años',
      },
      imagePath: 'assets/carousel/gold_barb.jpg',
      pointsValue: 1200,
    ),
    TriviaGame(
      id: 3,
      question:
          '¿Cuál es una característica distintiva de la perca europea (Perca fluviatilis) en cuanto a su comportamiento alimenticio?',
      answers: {
        0: 'Es exclusivamente herbívora',
        1: 'Prefiere alimentarse en aguas profundas',
        2: 'Es carnívora y se alimenta de otros peces (Correcta)',
        3: 'Se alimenta principalmente de algas marinas',
      },
      imagePath: 'assets/carousel/machaca.jpg',
      pointsValue: 1300,
    ),
    TriviaGame(
      id: 4,
      question:
          '¿Cuál es una característica distintiva del plecostoma rayado (Pterygoplichthys gibbiceps), también conocido como "pleco", en relación con su dieta?',
      answers: {
        0: 'Se alimenta principalmente de plantas acuáticas',
        1: 'Es exclusivamente carnívoro',
        2: 'Es omnívoro y consume algas y restos orgánicos (Correcta)',
        3: 'Prefiere alimentarse de insectos acuáticos',
      },
      imagePath: 'assets/carousel/characidum.jpg',
      pointsValue: 1400,
    ),
  ];

  bool validateCorrectAnswer({
    required int idQuestion,
    required int answerSelected,
  }) {
    if (idQuestion == 0 && answerSelected == 2 ||
        idQuestion == 1 && answerSelected == 1 ||
        idQuestion == 2 && answerSelected == 2 ||
        idQuestion == 3 && answerSelected == 2 ||
        idQuestion == 4 && answerSelected == 2) {
      return true;
    } else {
      return false;
    }
  }
}
