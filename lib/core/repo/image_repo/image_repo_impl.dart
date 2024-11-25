import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dashboard/core/error/sevcice_failure.dart';
import 'package:dashboard/core/repo/image_repo/image_repo.dart';
import 'package:dashboard/core/services/storage_service.dart';
import 'package:dashboard/core/utils/constants/backEnd_Endpoint.dart';

class ImageRepoImpl implements ImageRepo {

  final StorageService storageService;

  ImageRepoImpl({required this.storageService});
  @override
  Future<Either<Failuer, String>> uploadImage(File image) async {
     
    try {
  String imageUrl = await storageService.uploadFile(image, BackendEndpoint.images );
  return right(imageUrl); 
}  catch (e) {
   return Left(ServerFailure(errMessage: "Failed to upload file")); 
}
   
  }
}