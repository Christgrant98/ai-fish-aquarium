class TriviaGame {
  String question;
  List<String> answers;
  String imagePath;
  int points;
  bool isCorrect;

  TriviaGame({
    required this.question,
    required this.answers,
    required this.imagePath,
    required this.points,
    required this.isCorrect,
  });
}
