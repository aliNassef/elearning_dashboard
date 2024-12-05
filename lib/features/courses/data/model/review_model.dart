import 'package:elearning_dashboard/features/courses/domain/entity/review_entity.dart';

class ReviewModel {
  final String name;
  final String img;
  final String date;
  final double rate;
  final String comment;

  ReviewModel({
    required this.name,
    required this.img,
    required this.date,
    required this.rate,
    required this.comment,
  });

  factory ReviewModel.fromEntity(ReviewEntity entity) {
    return ReviewModel(
      name: entity.name,
      img: entity.img,
      date: entity.date,
      rate: entity.rate,
      comment: entity.comment,
    );
  }

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'],
      img: json['img'],
      date: json['date'],
      rate: json['rate'],
      comment: json['comment'],
    );
  }
  toMap() => {
        'name': name,
        'img': img,
        'date': date,
        'rate': rate,
        'comment': comment,
      };
}
