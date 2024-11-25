import 'package:bloc/bloc.dart';
import 'package:dashboard/core/repo/image_repo/image_repo.dart';
import 'package:dashboard/core/repo/product_repo/add_product_repo.dart';
import 'package:dashboard/features/add_product/domain/entities/add_product_entity.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  final ImageRepo imageRepo;
  final AddProductRepo addProductRepo;

  AddProductCubit(this.imageRepo, this.addProductRepo) : super(AddProductInitial());
  
  Future<void> addProduct(AddProductEntity addProductEntity) async {
    emit(AddProductLoading());
     var result = await imageRepo.uploadImage(addProductEntity.imageFile);

     result.fold((l) => emit(AddProductFailure(errMessage: l.errMessage)),
     
      (url) async {

        addProductEntity.imageUrl = url;
        var result = await addProductRepo.addProduct(addProductEntity);

        result.fold((l) => emit(AddProductFailure(errMessage: l.errMessage)), 
        (r) => emit(AddProductSuccess()));

   
     });
     
  }
  
}
