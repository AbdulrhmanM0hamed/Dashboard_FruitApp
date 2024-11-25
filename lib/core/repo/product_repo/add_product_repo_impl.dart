import 'package:dartz/dartz.dart';
import 'package:dashboard/core/error/sevcice_failure.dart';
import 'package:dashboard/core/repo/product_repo/add_product_repo.dart';
import 'package:dashboard/core/services/database_service.dart';
import 'package:dashboard/core/utils/constants/backEnd_Endpoint.dart';
import 'package:dashboard/features/add_product/data/models/add_product_model.dart';
import 'package:dashboard/features/add_product/domain/entities/add_product_entity.dart';

class AddProductRepoImpl implements AddProductRepo {
  final DatabaseService databaseService;

  AddProductRepoImpl({required this.databaseService});
  @override
  Future<Either<Failuer, void>> addProduct(
      AddProductEntity addProductRepository) async {
    try {
      await databaseService.addData(
          path: 'products',
          data: AddProductModel.fromEntity(addProductRepository).toJson());
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
