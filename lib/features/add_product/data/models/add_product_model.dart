import 'package:dashboard/features/add_product/domain/entities/add_product_entity.dart';

class AddProductModel {
  final String productName;
  final String code;
  final String description;
  final num price;
  final bool isFeatured;
  String? imageUrl; // فقط للإحتفاظ بعنوان الصورة

  AddProductModel({
    required this.productName,
    required this.code,
    required this.description,
    required this.price,
    required this.isFeatured,
    this.imageUrl,
  });

  factory AddProductModel.fromEntity(AddProductEntity addProductEntity) {
    return AddProductModel(
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
      'productName': productName,
      'code': code,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
    };
  }
}
