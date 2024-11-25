import 'package:bloc/bloc.dart';
import 'package:dashboard/core/repo/image_repo/image_repo.dart';
import 'package:dashboard/core/repo/product_repo/add_product_repo.dart';
import 'package:dashboard/features/add_product/domain/entities/add_product_entity.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  final ImageRepo imageRepo;
  final AddProductRepo addProductRepo;

  AddProductCubit(this.imageRepo, this.addProductRepo)
      : super(AddProductInitial());

  Future<void> addProduct(AddProductEntity addProductEntity) async {
    emit(AddProductLoading());

    // رفع الصورة
    var imageUploadResult =
        await imageRepo.uploadImage(addProductEntity.imageFile);

    imageUploadResult.fold(
      (failure) => emit(AddProductFailure(errMessage: failure.errMessage)),
      (url) async {
        addProductEntity.imageUrl = url; // تعيين رابط الصورة

        // إضافة المنتج الآن
        var addProductResult =
            await addProductRepo.addProduct(addProductEntity);

        addProductResult.fold(
          (failure) => emit(AddProductFailure(errMessage: failure.errMessage)),
          (_) => emit(AddProductSuccess()),
        );
      },
    );
  }
}
