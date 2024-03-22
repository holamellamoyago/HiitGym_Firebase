import 'package:firebase/presentation/screens/tutorial_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase/presentation/preferences/pref_usuarios.dart';
import 'package:firebase/presentation/screens/home_screen.dart';
import 'package:firebase/presentation/screens/login_screen.dart';
import 'package:firebase/presentation/screens/register_screen.dart';
import 'package:firebase/presentation/screens/rutinas/the_5dias_Screen.dart';

final prefs = PreferenciasUsuario();

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
        path: '/',
        name: HomeScreen.name,
        builder: (context, state) => const HomeScreen()),
    GoRoute(
        path: '/screen2',
        name: Rutina5Dias.name,
        builder: (context, state) => const Rutina5Dias()),
    GoRoute(
        path: '/login_screen',
        name: LoginPage.name,
        builder: (context, state) => const LoginPage()),
    GoRoute(
        path: '/register_screen',
        name: RegisterScreen.name,
        builder: (context, state) => const RegisterScreen()),
    GoRoute(
        path: '/tutorial_screen',
        name: TutorialScreen.name,
        builder: (context, state) => const TutorialScreen()),
  ],
);
