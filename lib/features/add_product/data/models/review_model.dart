import 'package:dashboard/features/add_product/domain/entities/review_entity.dart';

class ReviewModel {
  final String name;
  final String image;
  final int ratting;
  final String comment;
  final String date;

  ReviewModel(
      {required this.name,
      required this.image,
      required this.ratting,
      required this.comment,
      required this.date});


      factory ReviewModel.fromEntity(ReviewEntity entity) {
    return ReviewModel(
      name: entity.name,
      image: entity.image,
      ratting: entity.ratting,
      comment: entity.comment,
      date: entity.date,
    );
  }

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'],
      image: json['image'],
      ratting: json['ratting'],
      comment: json['comment'],
      date: json['date'],
    );
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'ratting': ratting,
      'comment': comment,
      'date': date,
    };
  }
}


