import 'package:elearning_dashboard/features/quizes/domain/entity/quize_entity.dart';

class QuizeModel {
  final String id;
  final String title;
  final String courseId;

  QuizeModel({
    required this.id,
    required this.title,
    required this.courseId,
  });

  factory QuizeModel.formEntity(QuizeEntity json) => QuizeModel(
        courseId: json.courseId,
        id: json.id,
        title: json.title,
      );

  toMap() => {
        'id': id,
        'title': title,
        'courseId': courseId,
      };
}
