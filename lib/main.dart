import 'package:flutter/material.dart';
import 'package:fruits_hub_admin/core/helper_functions/on_generate_routes.dart';
import 'package:fruits_hub_admin/features/dashboard/views/dashboard_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: onGenerateRoute,
      initialRoute: DashboardView.routeName,
    );
  }
}
