import '../../domain/entity/quize_entity.dart';

class QuizeModel {
  final String id;
  final String title;
  final String courseId;
  final int duration;

  QuizeModel({
    required this.id,
    required this.title,
    required this.courseId,
    required this.duration,
  });

  factory QuizeModel.formEntity(QuizeEntity json) => QuizeModel(
        courseId: json.courseId,
        id: json.id,
        title: json.title,
        duration: json.duration,
      );

  toMap() => {
        'id': id,
        'title': title,
        'courseId': courseId,
        'duration': duration,
      };
}
