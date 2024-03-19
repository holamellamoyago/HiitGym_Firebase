import 'package:firebase/infrastructure/helpers/the_5_dias_helper.dart';
import 'package:firebase/presentation/preferences/pref_usuarios.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TituloText(prefs: prefs),
              _SubtitleText(),
              Text('Esto es una column'),
              Expanded(child: _List())
            ],
          ),
        ),
      ),
    );
  }
}

class _SubtitleText extends StatelessWidget {
  const _SubtitleText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Text('Boxeador', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: colors.primary),);
  }
}

class TituloText extends StatelessWidget {
  const TituloText({
    super.key,
    required this.prefs,
  });

  final PreferenciasUsuario prefs;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Row(
      children: [
        const Text(
          'Hola ',
          style: TextStyle(fontSize: 42),
        ),
        Text(prefs.username,
            style: TextStyle(fontSize: 42, color: colors.primary)),
      ],
    );
  }
}

class _List extends StatelessWidget {
  const _List({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appHomeMenuItem.length,
      itemBuilder: ((context, index) {
        final homeMenuIndex = appHomeMenuItem[index];
        return Column(
          children: [
            ListTile(
              title: Text(homeMenuIndex.title),
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
