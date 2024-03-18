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

    return const Scaffold(
      body:
    );
  }
}

class _List extends StatelessWidget {
  _List({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appHomeMenuItem.length,
      itemBuilder: ((context, index) {
        final homeMenuIndex = appHomeMenuItem[index];
        return const Column(
          children: [
            Text('h0a'),
            Text('h0a'),
            ListTile(
              title: Text('hola'),
            )
          ],
        );
      }),
    );
  }
}

class HomeMenuItem {
  final String title;
  final String subtitle;
  final String url;
  final IconData icon;

  HomeMenuItem(
      {required this.title,
      required this.subtitle,
      required this.url,
      required this.icon});
}

final appHomeMenuItem = <HomeMenuItem>[
  HomeMenuItem(
      title: 'Rutina de los 5 días.',
      subtitle:
          'Rutina para las personas que se exigen un nivel de disciplina alto.',
      url: '/runtina_5dias_screen',
      icon: Icons.abc),
  HomeMenuItem(
      title: 'Rutina de los 3 días.',
      subtitle: 'Rutina que te exigira dar lo maximo de ti .',
      url: '/runtina_3dias_screen',
      icon: Icons.abc),
];
