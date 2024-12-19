import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_admin/core/errors/failures.dart';
import 'package:fruits_hub_admin/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_admin/core/services/cloud_storage/cloud_storage.dart';
import 'package:fruits_hub_admin/core/utils/constants/backend_end_points.dart';

class ImagesRepoImpl implements ImagesRepo {
  final CloudStorage cloudStorage;

  ImagesRepoImpl({required this.cloudStorage});
  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      String url =
          await cloudStorage.uploadFile(image, BackendEndPoints.images);
      return Right(url);
    } catch (e) {
      return Left(
        ServerFailure('Failed to upload image'),
      );
    }
  }
}
