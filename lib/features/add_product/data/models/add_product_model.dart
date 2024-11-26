import 'package:dashboard/features/add_product/data/models/review_model.dart';
import 'package:dashboard/features/add_product/domain/entities/add_product_entity.dart';
import 'package:dashboard/features/add_product/domain/entities/review_entity.dart';

class AddProductModel {
  final String productName;
  final String code;
  final String description;
  final num price;
  final bool isFeatured;
  String? imageUrl;
  final int expirtion;
  final int numberOfCalories;
  num avgRating = 0;
  final bool isOrganic;
  final num ratingCount;
  final int unitAmount;
  final List<ReviewModel> reviews;

  AddProductModel({
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
    required this.isFeatured,
    this.imageUrl,
  });

  factory AddProductModel.fromEntity(AddProductEntity addProductEntity) {
    return AddProductModel(
      reviews: addProductEntity.reviews.map((e) => ReviewModel.fromEntity(e)).toList(),
      expirtion: addProductEntity.expirtion,
      numberOfCalories: addProductEntity.numberOfCalories,
      unitAmount: addProductEntity.unitAmount,
      isOrganic: addProductEntity.isOrganic,
      ratingCount: addProductEntity.ratingCount,
      avgRating: addProductEntity.avgRating,
      productName: addProductEntity.productName,
      code: addProductEntity.code,
      description: addProductEntity.description,
      price: addProductEntity.price,
      isFeatured: addProductEntity.isFeatured,
      imageUrl: addProductEntity.imageUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reviews': reviews.map((e) => e.toJson()).toList(),
      'productName': productName,
      'code': code,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirtion': expirtion,
      'numberOfCalories': numberOfCalories,
      'avgRating': avgRating,
      'isOrganic': isOrganic,
      'ratingCount': ratingCount,
      'unitAmount': unitAmount
    };
  }
}
