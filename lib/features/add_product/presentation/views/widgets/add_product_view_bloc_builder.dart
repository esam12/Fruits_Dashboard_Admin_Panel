import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_admin/core/utils/popups/loaders.dart';
import 'package:fruits_hub_admin/core/widgets/custom_progress_hud.dart';
import 'package:fruits_hub_admin/features/add_product/presentation/manager/cubit/add_product_cubit.dart';
import 'package:fruits_hub_admin/features/add_product/presentation/views/widgets/add_product_view_body.dart';

class AddProductViewBlocBuilder extends StatelessWidget {
  const AddProductViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          FLoaders.successSnackBar(
              context: context, title: 'Product added successfully');
        }
        if (state is AddProductFailure) {
          FLoaders.errorSnackBar(context: context, title: state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is AddProductLoading,
          child: const AddProductViewBody(),
        );
      },
    );
  }
}
