import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_admin/core/helper_functions/get_order_dummy_data.dart';
import 'package:fruits_hub_admin/core/services/get_it_service.dart';
import 'package:fruits_hub_admin/features/orders/domain/repos/orders_repo.dart';
import 'package:fruits_hub_admin/features/orders/presentation/manager/fetch_orders/fetch_orders_cubit.dart';
import 'package:fruits_hub_admin/features/orders/presentation/widgets/orders_view_body.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});
  static const String routeName = 'orders';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchOrdersCubit(
        getIt.get<OrdersRepo>(),
      ),
      child: const Scaffold(
        body: OrdersViewBodyBuilder(),
      ),
    );
  }
}

class OrdersViewBodyBuilder extends StatefulWidget {
  const OrdersViewBodyBuilder({
    super.key,
  });

  @override
  State<OrdersViewBodyBuilder> createState() => _OrdersViewBodyBuilderState();
}

class _OrdersViewBodyBuilderState extends State<OrdersViewBodyBuilder> {

  @override
  void initState() {
    super.initState();
    context.read<FetchOrdersCubit>().fetchOrders();
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchOrdersCubit, FetchOrdersState>(
      builder: (context, state) {
        if (state is FetchOrdersSuccess) {
          return OrdersViewBody(orders: state.orders);
        } else if (state is FetchOrdersError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return Skeletonizer(
            child: OrdersViewBody(
              orders: [
                getDummyOrder(),
                getDummyOrder(),
              ],
            ),
          );
        }
      },
    );
  }
}
