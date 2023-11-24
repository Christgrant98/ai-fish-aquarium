import 'package:login_flutter/src/models/trivia.dart';

class TriviaGameData {
  List<TriviaGame> questions = <TriviaGame>[
    TriviaGame(
      id: 0,
      question:
          '¿En qué tipo de hábitat acuático se encuentra comúnmente la anguila?',
      answers: {
        1: 'Océano Atlántico',
        2: 'Agua salada de mar',
        3: 'Ríos y lagos de agua dulce (Correcta)',
        4: 'Estuarios de agua salobre',
      },
      imagePath: 'assets/carousel/electric_eel.jpg',
      points: 1000,
    ),
    TriviaGame(
      id: 1,
      question:
          '¿Dónde suele encontrarse el sabalote, un pez de gran tamaño y cuerpo plateado?',
      answers: {
        1: 'Aguas dulces de lagos y embalses',
        2: 'Estuarios y desembocaduras de ríos (Correcta)',
        3: 'Fondo del océano en aguas profundas',
        4: 'Arrecifes de coral en aguas saladas',
      },
      imagePath: 'assets/carousel/mexican_cavefish.jpg',
      points: 1000,
    ),
    TriviaGame(
      id: 2,
      question:
          '¿Cuál es la edad máxima que puede alcanzar un pez dorado (Carassius auratus) en condiciones ideales de cuidado?',
      answers: {
        1: '5 años',
        2: '15 años',
        3: '25 años (Correcta)',
        4: '40 años',
      },
      imagePath: 'assets/carousel/gold_barb.jpg',
      points: 1000,
    ),
    TriviaGame(
      id: 3,
      question:
          '¿Cuál es una característica distintiva de la perca europea (Perca fluviatilis) en cuanto a su comportamiento alimenticio?',
      answers: {
        1: 'Es exclusivamente herbívora',
        2: 'Prefiere alimentarse en aguas profundas',
        3: 'Es carnívora y se alimenta de otros peces (Correcta)',
        4: 'Se alimenta principalmente de algas marinas',
      },
      imagePath: 'assets/carousel/machaca.jpg',
      points: 1000,
    ),
    TriviaGame(
      id: 4,
      question:
          '¿Cuál es una característica distintiva del plecostoma rayado (Pterygoplichthys gibbiceps), también conocido como "pleco", en relación con su dieta?',
      answers: {
        1: 'Se alimenta principalmente de plantas acuáticas',
        2: 'Es exclusivamente carnívoro',
        3: 'Es omnívoro y consume algas y restos orgánicos (Correcta)',
        4: 'Prefiere alimentarse de insectos acuáticos',
      },
      imagePath: 'assets/carousel/characidum.jpg',
      points: 1000,
    ),
  ];
}
