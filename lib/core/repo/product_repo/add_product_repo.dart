import 'package:dartz/dartz.dart';
import 'package:dashboard/core/error/sevcice_failure.dart';
import 'package:dashboard/features/add_product/domain/entities/add_product_entity.dart';

abstract class AddProductRepo {
  Future<Either<Failuer,AddProductEntity>> addProduct(AddProductEntity addProductRepository);
}