import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dashboard/core/error/sevcice_failure.dart';

abstract  class  ImageRepo {

  Future<Either<Failuer , String >> uploadImage(File image) ;


}