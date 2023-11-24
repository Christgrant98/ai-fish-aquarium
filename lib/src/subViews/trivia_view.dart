import 'package:flutter/material.dart';
import 'package:login_flutter/src/models/peces_model.dart';
import 'package:login_flutter/src/providers/carousel_provider.dart';
import 'package:login_flutter/src/utils/widgets/base_modal.dart';
import 'package:login_flutter/src/utils/widgets/custom_button.dart';
import 'package:login_flutter/src/utils/widgets/text_view.dart';

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
  int indexQuestion = 0;
  QuestionStep step = QuestionStep.initial;
  // late List<Pez> pecesData;
  TriviaGameData questionsData = TriviaGameData();

  // @override
  // void initState() {
  //   super.initState();
  //   cargarPecesData();
  // }

  // Future<void> cargarPecesData() async {
  //   pecesData = await carouselProvider.cargarData();
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    if (QuestionStep.initial == step) {
      return _buildInitialStepView();
    } else if (QuestionStep.first == step) {
      return _buildQuestionStepView();
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

  Widget _buildQuestionStepView() {
    return QuestionContainer(
      gameData: questionsData,
      index: indexQuestion,
    );
  }

  Widget _buildInitialStepView() {
    return Column(
      children: [
        CustomButton(
            text: 'GO',
            onPressed: () {
              showDialog(
                  barrierColor: Colors.black87,
                  context: context,
                  builder: (ctx) {
                    return BaseModal(
                      paddingValue: 5,
                      heightFactor: .2,
                      widthFactor: .9,
                      content: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const TextView(
                            text: 'Deseas empezar ya?',
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomButton(
                                width: 140,
                                isAppColor: false,
                                buttonTextColor: Colors.black,
                                text: 'Cancel',
                                onPressed: () => Navigator.of(ctx).pop(),
                              ),
                              CustomButton(
                                width: 150,
                                text: 'Empezar ya!',
                                onPressed: () => setState(() {
                                  indexQuestion++;
                                  step = QuestionStep.first;
                                  Navigator.of(ctx).pop();
                                }),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  });
            })
      ],
    );
  }
}

class QuestionContainer extends StatelessWidget {
  final int index;
  final TriviaGameData gameData;

  const QuestionContainer({
    Key? key,
    required this.gameData,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .8,
      width: MediaQuery.of(context).size.width * .9,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          TextView(
            text: index.toString(),
          ),
          Image.asset(gameData.questions[0].imagePath),
          const SizedBox(height: 15),
          TextView(
            text: gameData.questions[0].question,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: gameData.questions[0].answers.length,
              itemBuilder: (context, answerIndex) {
                final answer = gameData.questions[0].answers[answerIndex];
                return Card(
                  child: ListTile(
                    title: Text(answer.toString()),
                    onTap: () {},
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
