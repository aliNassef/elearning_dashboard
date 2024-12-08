class QuestionEntity {
  final String question;
  final List<String> options;
  final int corrextAnswer;
  final String quizId;

  QuestionEntity({
    required this.question,
    required this.options,
    required this.corrextAnswer,
    required this.quizId,
  });
}
