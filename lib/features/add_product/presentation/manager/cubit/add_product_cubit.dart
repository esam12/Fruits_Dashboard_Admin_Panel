import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_admin/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_admin/core/repos/product_repo/products_repo.dart';
import 'package:fruits_hub_admin/features/add_product/domain/entities/product_entity.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imagesRepo, this.productsRepo)
      : super(AddProductInitial());

  final ImagesRepo imagesRepo;
  final ProductsRepo productsRepo;

  Future<void> addProduct(ProductEntity addProductInputEntity) async {
    emit(AddProductLoading());

    var result = await imagesRepo.uploadImage(addProductInputEntity.image);

    result.fold(
      (l) {
        emit(AddProductFailure(l.message));
      },
      (url) async {
        addProductInputEntity.imageUrl = url;
        var result = await productsRepo.addProduct(addProductInputEntity);
        result.fold(
          (l) => emit(AddProductFailure(l.message)),
          (r) => emit(AddProductSuccess()),
        );
      },
    );
  }
}
