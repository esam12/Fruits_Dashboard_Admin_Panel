import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_admin/core/errors/failures.dart';

abstract class ImagesRepo {
  Future<Either<Failure,String>> uploadImage(File image);
}