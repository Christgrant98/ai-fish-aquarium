import 'package:flutter/material.dart';
import 'package:login_flutter/src/models/peces_model.dart';
import 'package:login_flutter/src/providers/carousel_provider.dart';

import '../data/trivia_game_data.dart';

enum QuestionStep {
  initial,
  first,
  second,
  third,
  fourth,
  fifth,
}

class TriviaView extends StatefulWidget {
  const TriviaView({super.key});

  @override
  State<TriviaView> createState() => _TriviaViewState();
}

class _TriviaViewState extends State<TriviaView> {
  QuestionStep step = QuestionStep.initial;
  late List<Pez> pecesData;
  TriviaGameData questionsData = TriviaGameData();

  @override
  void initState() {
    super.initState();
    cargarPecesData();
  }

  Future<void> cargarPecesData() async {
    pecesData = await carouselProvider.cargarData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (QuestionStep.initial == step) {
      return _buildInitialStepView();
    } else if (QuestionStep.first == step) {
      return Container();
    } else if (QuestionStep.second == step) {
      return Container();
    } else if (QuestionStep.third == step) {
      return Container();
    } else if (QuestionStep.fourth == step) {
      return Container();
    } else {
      return Container();
    }
  }

  Widget _buildInitialStepView() {
    return Container();
  }
}
