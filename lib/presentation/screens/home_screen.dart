import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/configure/auth/auth.dart';
import 'package:firebase/infrastructure/helpers/the_5_dias_helper.dart';
import 'package:firebase/presentation/preferences/pref_usuarios.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    final FirebaseauthService _auth = FirebaseauthService();
    var prefs = PreferenciasUsuario();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TituloText(prefs: prefs),
              const _SubtitleText(),
              const Text('Firebase Firestore'),
              // Se utilizan los snapshots para traer datos varias veces , con el GET solo tendriamos que cambiar el stream por un future.
              const _ListaUsuarios(),
              const Text('Solo uno'),
              _NombreUsuario(prefs: prefs),
              const Expanded(child: _List())
            ],
          ),
        ),
      ),
    );
  }
}

class _NombreUsuario extends StatelessWidget {
  const _NombreUsuario({
    super.key,
    required this.prefs,
  });

  final PreferenciasUsuario prefs;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance
          .collection('User')
          .doc(prefs.ultimouid)
          .get(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final _data2 = snapshot.data.data();
          if (_data2!.isNotEmpty) {
            return Column(
              children: [Text(_data2['username'])],
            );
          } else {
            return Placeholder();
          }
        }
      },
    );
  }
}

class _ListaUsuarios extends StatelessWidget {
  const _ListaUsuarios({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('User')
          // .doc(prefs.ultimouid)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final _data = snapshot.data?.docs;
          if (_data!.isNotEmpty) {
            return Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: _data.length,
                    itemBuilder: (context, index) {
                      if (_data.isNotEmpty) {
                        return Text(_data[index]['username']);
                      } else {
                        Placeholder();
                      }
                    }),
              ],
            );
          } else {
            return Placeholder();
          }
        }
      },
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
    return Text(
      'Boxeador',
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 18, color: colors.primary),
    );
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
