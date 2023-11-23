class TriviaGame {
  int? id;
  String question;
  Map<int, String> answers;
  String imagePath;
  int points;
  bool isCorrect;

  TriviaGame({
    this.id,
    required this.question,
    required this.answers,
    required this.imagePath,
    required this.points,
    required this.isCorrect,
  });

  bool _SelectCorrectAnswer(int idQuestion, int answer) {}
}
