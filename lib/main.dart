import 'package:dashboard/core/helpers_functions/on_genrated_routes.dart';
import 'package:dashboard/core/utils/theme/theme.dart';
import 'package:dashboard/features/dashboard/presentation/view/dashboard.dart';
import 'package:dashboard/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      title: 'Flutter Demo',
      onGenerateRoute: onGenratedRoutes,
      initialRoute: DashboardView.routeName,
    );
  }
  }