import 'package:flutter/material.dart';
import 'package:fruits_hub_admin/features/dashboard/views/widgets/dashboard_view_body.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  static const routeName = 'dashboard';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DashboardViewBody(),
    );
  }
}
