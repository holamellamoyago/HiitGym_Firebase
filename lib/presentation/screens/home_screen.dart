import 'package:firebase/presentation/preferences/pref_usuarios.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// class HomeMenuItem {
//   final String title;
//   final String caption;
// }

// const appMenuItems = <MenuItem>[
//     MenuItem(
//       title: 'Cambiar tema',
//       subtitle: 'Cambiar tema de la aplicacion',
//       link: '/theme-changer',
//       icon: Icons.color_lens_outlined),

class HomeScreen extends StatefulWidget {
  static const name = '/';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var prefs = PreferenciasUsuario();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Esta es la Home Screen'),
          OutlinedButton(
              onPressed: () {
                context.go('/screen2');
              },
              child: const Text('Navegar a Rutina5Dias')),
          Text(prefs.ultimouid)
        ],
      ),
    );
  }
}
