class QuestionEntity {
  final String question;
  final List<String> options;
  final int corrextAnswer;

  QuestionEntity({
    required this.question,
    required this.options,
    required this.corrextAnswer,
  });
}
