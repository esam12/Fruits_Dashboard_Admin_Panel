import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_admin/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_admin/core/repos/product_repo/products_repo.dart';
import 'package:fruits_hub_admin/core/services/get_it_service.dart';
import 'package:fruits_hub_admin/core/widgets/build_app_bar.dart';
import 'package:fruits_hub_admin/features/add_product/presentation/manager/cubit/add_product_cubit.dart';
import 'package:fruits_hub_admin/features/add_product/presentation/views/widgets/add_product_view_bloc_builder.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const routeName = 'add-product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Add Product'),
      body: BlocProvider(
        create: (context) => AddProductCubit(
          getIt.get<ImagesRepo>(),
          getIt.get<ProductsRepo>(),
        ),
        child: const AddProductViewBlocBuilder(),
      ),
    );
  }
}
