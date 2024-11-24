import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dashboard/core/error/sevcice_failure.dart';
import 'package:dashboard/core/repo/image_repo/image_repo.dart';

class ImageRepoImpl implements ImageRepo {
  @override
  Future<Either<Failuer, String>> uploadImage(File image) {
    // TODO: implement uploadImage
    throw UnimplementedError();
  }
}