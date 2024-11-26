import 'dart:io';

import 'package:dashboard/features/add_product/domain/entities/review_entity.dart';

class AddProductEntity {
  final String productName;
  final String code;
  final String description;
  final num price;
  final File imageFile;
  final bool isFeatured;
  String? imageUrl;

  final int expirtion;
  final int numberOfCalories;
  num avgRating = 0;
  final bool isOrganic;
  final num ratingCount;
  final int unitAmount;
  final List <ReviewEntity> reviews ; 

  AddProductEntity({
    required this.reviews, 
    required this.expirtion,
    required this.numberOfCalories,
    required this.unitAmount,
    this.isOrganic = false,
    this.ratingCount = 0,
    this.avgRating = 0,
    required this.productName,
    required this.code,
    required this.description,
    required this.price,
    required this.imageFile,
    required this.isFeatured,
    this.imageUrl,
  });
}
