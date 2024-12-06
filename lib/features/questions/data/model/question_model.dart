import 'package:elearning_dashboard/features/questions/domain/entity/question_entity.dart';

class QuestionModel {
  final String question;
  final List<String> options;
  final int correctAnswer;

  QuestionModel({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });

  factory QuestionModel.fromEntity(QuestionEntity json) => QuestionModel(
        question: json.question,
        options: List<String>.from(json.options.map((x) => x)),
        correctAnswer: json.corrextAnswer,
      );

 Map<String, dynamic> toMap() => {
        'question': question,
        'options': List<String>.from(options.map((x) => x)),
        'correctAnswer': correctAnswer,
      };
}
