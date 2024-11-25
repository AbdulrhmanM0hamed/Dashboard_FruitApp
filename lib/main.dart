import 'package:dashboard/core/helpers_functions/on_genrated_routes.dart';
import 'package:dashboard/core/services/service_locator.dart';
import 'package:dashboard/core/utils/theme/theme.dart';
import 'package:dashboard/features/dashboard/presentation/view/dashboard.dart';
import 'package:dashboard/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  // Client client = Client();
  // client.setProject('6744b314002997b7d04d');
  setupServiceLocator();
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //  final supabase = SupabaseClient('https://aegggtwxycbpxyzfandr.supabase.co', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFlZ2dndHd4eWNicHh5emZhbmRyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzI1MTIzNzgsImV4cCI6MjA0ODA4ODM3OH0.wl5mRZgA1y1pqKHxMcKSK7wq3o5rclX-7WrnSqcFNJs');

  // final storageResponse = await supabase
  //     .storage
  //     .createBucket('FruitAppp');

  await Supabase.initialize(
    url: 'https://aegggtwxycbpxyzfandr.supabase.co', // Supabase URL
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFlZ2dndHd4eWNicHh5emZhbmRyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzI1MTIzNzgsImV4cCI6MjA0ODA4ODM3OH0.wl5mRZgA1y1pqKHxMcKSK7wq3o5rclX-7WrnSqcFNJs', // Supabase Anon Key
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.v
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
