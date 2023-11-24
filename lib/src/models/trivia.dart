class TriviaGame {
  int? id;
  String question;
  Map<int, String> answers;
  String imagePath;
  int points;

  TriviaGame({
    this.id,
    required this.question,
    required this.answers,
    required this.imagePath,
    required this.points,
  });
}
