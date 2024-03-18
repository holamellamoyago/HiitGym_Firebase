import 'package:firebase/configure/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase/configure/router/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase/presentation/preferences/pref_usuarios.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenciasUsuario.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // theme: AppTheme.getTheme(),
      theme: Apptheme2().getTheme(),
      routerConfig: appRouter,
    );
  }
}
