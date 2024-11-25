import 'package:dartz/dartz.dart';
import 'package:dashboard/core/error/sevcice_failure.dart';
import 'package:dashboard/core/repo/product_repo/add_product_repo.dart';
import 'package:dashboard/features/add_product/domain/entities/add_product_entity.dart';

class AddProductRepoImpl implements AddProductRepo {
  @override
  Future<Either<Failuer, void>> addProduct(AddProductEntity addProductRepository) {
    // TODO: implement addProduct
    throw UnimplementedError();
  }
  
}