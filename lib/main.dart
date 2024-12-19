import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_admin/core/helper_functions/on_generate_routes.dart';
import 'package:fruits_hub_admin/core/services/custom_bloc_observer.dart';
import 'package:fruits_hub_admin/core/services/get_it_service.dart';
import 'package:fruits_hub_admin/core/utils/keys.dart';
import 'package:fruits_hub_admin/features/dashboard/views/dashboard_view.dart';
import 'package:fruits_hub_admin/firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: KSupabaseUrl,
    anonKey: KSupabaseKey,
  );

  Bloc.observer = CustomBlocObserver();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: DashboardView.routeName,
    );
  }
}
