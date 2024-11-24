import 'dart:io';

class AddProductEntity {
  final String productName;
  final String code;
  final String description;
  final num price;
  final File imageFile;
  final bool isFeatured;
  final String? imageUrl;

  AddProductEntity({
    required this.productName,
    required this.code,
    required this.description,
    required this.price,
    required this.imageFile,
    required this.isFeatured,
    this.imageUrl,
  });
}
