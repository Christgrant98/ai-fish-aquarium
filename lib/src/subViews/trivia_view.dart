import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
  resultPoints,
  resultChecker,
}

class TriviaView extends StatefulWidget {
  const TriviaView({super.key});

  @override
  State<TriviaView> createState() => _TriviaViewState();
}

class _TriviaViewState extends State<TriviaView> {
  TriviaGameData questionsData = TriviaGameData();
  QuestionStep step = QuestionStep.initial;
  int? selectedAnswerIndex;
  int indexQuestion = 0;
  int points = 0;
  int answeredCorrecltyCount = 0;

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
    } else if (QuestionStep.fifth == step) {
      return _buildQuestionStepView(
        navigationAction: () => setState(() {
          step = QuestionStep.resultPoints;
          indexQuestion = 0;
        }),
      );
    } else if (QuestionStep.resultPoints == step) {
      return _buildResultView(
        navigationAction: () => setState(() {
          step = QuestionStep.resultChecker;
        }),
      );
    } else {
      return Column(
        children: [
          const SizedBox(height: 25),
          Container(
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
            height: MediaQuery.of(context).size.height * .45,
            child: QuestionsInformationTrivia(
              indexQuestion: 0,
              questionsData: questionsData,
            ),
          ),
          const SizedBox(height: 25),
          Container(
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
            height: MediaQuery.of(context).size.height * .45,
            child: QuestionsInformationTrivia(
              indexQuestion: 1,
              questionsData: questionsData,
            ),
          ),
          const SizedBox(height: 25),
          Container(
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
            height: MediaQuery.of(context).size.height * .45,
            child: QuestionsInformationTrivia(
              indexQuestion: 2,
              questionsData: questionsData,
            ),
          ),
          const SizedBox(height: 25),
          Container(
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
            height: MediaQuery.of(context).size.height * .45,
            child: QuestionsInformationTrivia(
              indexQuestion: 3,
              questionsData: questionsData,
            ),
          ),
          const SizedBox(height: 25),
          Container(
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
            height: MediaQuery.of(context).size.height * .46,
            child: QuestionsInformationTrivia(
              indexQuestion: 4,
              questionsData: questionsData,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 20),
            child: CustomButton(
              width: MediaQuery.of(context).size.width * .9,
              text: 'Go Home',
              onPressed: () => GoRouter.of(context).go('/home_view'),
            ),
          )
        ],
      );
    }
  }

  Widget _buildResultView({required void Function() navigationAction}) {
    return Column(
      children: [
        const TextView(
          text: 'Resultados de tu Trivia',
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        const SizedBox(height: 30),
        Container(
          padding: const EdgeInsets.all(16.0),
          width: MediaQuery.of(context).size.width * .9,
          height: MediaQuery.of(context).size.height * .55,
          decoration: BoxDecoration(
            color: Colors.teal,
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
              const TextView(
                text: 'Puntos obtenidos',
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
              const SizedBox(height: 15),
              Container(
                width: MediaQuery.of(context).size.width * .9,
                height: MediaQuery.of(context).size.height * .1,
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
                child: Center(
                  child: TextView(
                    text: '${points.toString()}/6000',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const TextView(
                text: 'Resultados de la Trivia:',
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
              const SizedBox(height: 15),
              Container(
                width: MediaQuery.of(context).size.width * .9,
                height: MediaQuery.of(context).size.height * .1,
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
                child: Center(
                  child: TextView(
                    text: '${answeredCorrecltyCount.toString()}/5',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const TextView(
                text: 'Calificacion:',
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
              const SizedBox(height: 15),
              Container(
                width: MediaQuery.of(context).size.width * .9,
                height: MediaQuery.of(context).size.height * .1,
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
                child: Center(
                  child: TextView(
                    text:
                        '${(answeredCorrecltyCount / 5 * 100).toStringAsFixed(0)}%',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 60),
        CustomButton(
            width: MediaQuery.of(context).size.width * .9,
            text: 'Ver Resultados',
            onPressed: () {
              navigationAction();
            })
      ],
    );
  }

  Widget _buildQuestionStepView({
    required final void Function() navigationAction,
  }) {
    return Stack(
      children: [
        Container(
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
              Expanded(
                child: _buildTiviaGameComponent(),
              ),
              const SizedBox(height: 5),
              if (selectedAnswerIndex != null)
                CustomButton(
                  onPressed: () {
                    bool isCorrectAnswered =
                        questionsData.validateCorrectAnswer(
                      idQuestion: indexQuestion,
                      answerSelected: selectedAnswerIndex!,
                    );
                    if (isCorrectAnswered) {
                      int updatedPoints = points +
                          questionsData.questions[indexQuestion].pointsValue;

                      points = updatedPoints;
                      answeredCorrecltyCount++;
                    }
                    selectedAnswerIndex = null;
                    navigationAction();
                  },
                  text: 'Continuar',
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTiviaGameComponent() {
    return Column(
      children: [
        TextView(
          text: 'Pregunta #${(indexQuestion + 1).toString()}',
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 5),
        Image.asset(questionsData.questions[indexQuestion].imagePath),
        const SizedBox(height: 10),
        TextView(
          text: questionsData.questions[indexQuestion].question,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.center,
          fontSize: 14,
        ),
        const SizedBox(height: 5),
        Expanded(
          child: ListView.builder(
            reverse: false,
            shrinkWrap: true,
            itemCount: questionsData.questions[indexQuestion].answers.length,
            itemBuilder: (context, answerIndex) {
              final answer =
                  questionsData.questions[indexQuestion].answers[answerIndex];

              return Card(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.transparent,
                    width: 0.1,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 2,
                color: selectedAnswerIndex == answerIndex
                    ? Colors.greenAccent
                    : const Color.fromARGB(255, 240, 240, 240),
                child: ListTile(
                  title: TextView(
                    text: answer.toString(),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  onTap: () {
                    setState(() {
                      selectedAnswerIndex = answerIndex;
                    });
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildInitialStepView() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .7,
      child: InkWell(
        onTap: () {
          showDialog(
            barrierColor: Colors.black87,
            context: context,
            builder: (ctx) {
              return BaseModal(
                paddingValue: 5,
                heightFactor: .22,
                widthFactor: .9,
                content: Column(
                  children: [
                    const SizedBox(height: 20),
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
            },
          );
        },
        child: const CircleAvatar(
          backgroundColor: Colors.black,
          radius: 65,
          child: TextView(
            fontWeight: FontWeight.w900,
            text: 'GO',
            fontSize: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class QuestionsInformationTrivia extends StatelessWidget {
  final int indexQuestion;
  final TriviaGameData questionsData;
  const QuestionsInformationTrivia({
    super.key,
    required this.indexQuestion,
    required this.questionsData,
  });

  @override
  Widget build(BuildContext context) {
    int correctAnswerId =
        questionsData.getCorrectAnswersId(idQuestion: indexQuestion);
    return Column(
      children: [
        TextView(
          text: 'Pregunta #${(indexQuestion + 1).toString()}',
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 10),
        TextView(
          text: questionsData.questions[indexQuestion].question,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.center,
          fontSize: 14,
        ),
        const SizedBox(height: 5),
        Expanded(
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            reverse: false,
            itemCount: questionsData.questions[indexQuestion].answers.length,
            itemBuilder: (context, answerIndex) {
              final answer =
                  questionsData.questions[indexQuestion].answers[answerIndex];
              bool isCorrectAnswer = answerIndex == correctAnswerId;
              return Card(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.transparent,
                    width: 0.1,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 2,
                color: isCorrectAnswer
                    ? Colors.greenAccent
                    : const Color.fromARGB(255, 240, 240, 240),
                child: ListTile(
                  enabled: false,
                  title: TextView(
                    text: answer.toString(),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  onTap: () {},
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
