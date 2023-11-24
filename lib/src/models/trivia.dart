class TriviaGame {
  int? id;
  String question;
  Map<int, String> answers;
  String imagePath;
  int points;
  bool? isCorrect;

  TriviaGame({
    this.id,
    required this.question,
    required this.answers,
    required this.imagePath,
    required this.points,
    this.isCorrect,
  });

  bool _selectCorrectAnswer(
    int idQuestion,
    int answerSelected,
  ) {
    if (idQuestion == 0 && answerSelected == 3 ||
        idQuestion == 1 && answerSelected == 2 ||
        idQuestion == 2 && answerSelected == 3 ||
        idQuestion == 3 && answerSelected == 3 ||
        idQuestion == 4 && answerSelected == 3) {
      return true;
    } else {
      return false;
    }
  }
}
