import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_admin/core/utils/popups/loaders.dart';
import 'package:fruits_hub_admin/features/orders/presentation/manager/update_order/update_order_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateOrderBuilderWidget extends StatelessWidget {
  const UpdateOrderBuilderWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateOrderCubit, UpdateOrderState>(
      listener: (context, state) {
        if (state is UpdateOrderSuccess) {
          FLoaders.successSnackBar(context: context, title: 'Order updated');
        }
        if (state is UpdateOrderError) {
          FLoaders.errorSnackBar(context: context, title: state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is UpdateOrderLoading,
          child: child,
        );
      },
    );
  }
}
