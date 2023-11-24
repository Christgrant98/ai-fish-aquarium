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
  QuestionStep step = QuestionStep.initial;
  TriviaGameData questionsData = TriviaGameData();
  int indexQuestion = 0;

  @override
  Widget build(BuildContext context) {
    if (QuestionStep.initial == step) {
      return _buildInitialStepView();
    } else if (QuestionStep.first == step) {
      return _buildQuestionStepView(
        navigationAction: () => setState(() {
          step = QuestionStep.second;
          indexQuestion++;
        }),
      );
    } else if (QuestionStep.second == step) {
      return _buildQuestionStepView(
        navigationAction: () => setState(() {
          step = QuestionStep.third;
          indexQuestion++;
        }),
      );
    } else if (QuestionStep.third == step) {
      return _buildQuestionStepView(
        navigationAction: () => setState(() {
          step = QuestionStep.fourth;
          indexQuestion++;
        }),
      );
    } else if (QuestionStep.fourth == step) {
      return _buildQuestionStepView(
        navigationAction: () => setState(() {
          step = QuestionStep.fifth;
          indexQuestion++;
        }),
      );
    } else {
      return _buildQuestionStepView(
        navigationAction: () => setState(() {
          step = QuestionStep.initial;
          indexQuestion = 0;
        }),
      );
    }
  }

  Widget _buildQuestionStepView({
    required void Function() navigationAction,
  }) {
    return QuestionContainer(
      gameData: questionsData,
      indexQuestion: indexQuestion,
      navigationAction: navigationAction,
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

class QuestionContainer extends StatefulWidget {
  final int indexQuestion;
  final TriviaGameData gameData;
  final void Function() navigationAction;

  const QuestionContainer({
    Key? key,
    required this.gameData,
    required this.indexQuestion,
    required this.navigationAction,
  }) : super(key: key);

  @override
  QuestionContainerState createState() => QuestionContainerState();
}

class QuestionContainerState extends State<QuestionContainer> {
  int? selectedAnswerIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width * 0.9,
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
            text: widget.indexQuestion.toString(),
          ),
          const SizedBox(height: 15),
          TextView(
            text: widget.gameData.questions[widget.indexQuestion].question,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: _buildAnswerBox(),
          ),
          if (selectedAnswerIndex != null)
            CustomButton(
              onPressed: widget.navigationAction,
              text: 'Continuar',
            ),
        ],
      ),
    );
  }

  ListView _buildAnswerBox() {
    return ListView.builder(
      itemCount: widget.gameData.questions[widget.indexQuestion].answers.length,
      itemBuilder: (context, answerIndex) {
        final answer = widget
            .gameData.questions[widget.indexQuestion].answers[answerIndex];

        return Card(
          color: selectedAnswerIndex == answerIndex
              ? Colors.greenAccent
              : Colors.white,
          child: ListTile(
            title: TextView(
              text: answer.toString(),
              fontSize: 12,
            ),
            onTap: () {
              setState(() {
                selectedAnswerIndex = answerIndex;
              });
            },
          ),
        );
      },
    );
  }
}
