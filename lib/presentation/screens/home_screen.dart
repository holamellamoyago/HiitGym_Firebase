import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/configure/auth/auth.dart';
import 'package:firebase/presentation/screens_widgets.dart';
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
    final FirebaseauthService _auth = FirebaseauthService();
    var prefs = PreferenciasUsuario();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/logo.png'), scale: 1.2)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TituloText(prefs: prefs),
                  // const _SubtitleText(),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                  const _HomeScreenCards(),
                  // const Text('Firebase Firestore'),
                  // Se utilizan los snapshots para traer datos varias veces , con el GET solo tendriamos que cambiar el stream por un future.
                  // const _ListaUsuarios(),
                  // const Text('Solo uno'),
                  // _NombreUsuario(prefs: prefs),
                  Expanded(child: _List())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HomeScreenCards extends StatelessWidget {
  const _HomeScreenCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String title1 = 'Horarios';
    String subtitle1 = 'Consulta nuestros horarios';
    IconData icon1 = Icons.calendar_month;

    String title2 = 'Apuntarse';
    String subtitle2 = 'Recuerda apuntarte antes de asistir !';
    IconData icon2 = Icons.fitness_center;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CardHomeScreen(title1: title1, subtitle1: subtitle1, icon1: icon1),
        CardHomeScreen(title1: title2, subtitle1: subtitle2, icon1: icon2),
      ],
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
              children: [
                Text(
                  _data2['username'],
                ),
              ],
            );
          } else {
            return const Placeholder();
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
          final _data2 = snapshot.data?.docs;
          if (_data2!.isNotEmpty) {
            return Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: _data2.length,
                    itemBuilder: (context, index) {
                      if (_data2.isNotEmpty) {
                        return Text(_data2[index]['username']);
                      } else {
                        const Placeholder();
                      }
                      return const Placeholder();
                    }),
              ],
            );
          } else {
            return const Placeholder();
          }
        }
      },
    );
  }
}

// class _SubtitleText extends StatelessWidget {
//   const _SubtitleText({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final colors = Theme.of(context).colorScheme;
//     return Text(
//       'Boxeador',
//       style: TextStyle(
//           fontWeight: FontWeight.bold, fontSize: 18, color: colors.primary),
//     );
//   }
// }

class TituloText extends StatelessWidget {
  const TituloText({
    super.key,
    required this.prefs,
  });

  final PreferenciasUsuario prefs;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      children: [
        Row(
          children: [
            const Text(
              'Hola ',
              style: TextStyle(fontSize: 42),
            ),
            GetUsername(prefs: prefs, colors: colors),
          ],
        ),
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
    final titleStyleLarge = Theme.of(context).textTheme.titleLarge;
    final subtitleStyleSmall = Theme.of(context).textTheme.bodyMedium;
    return ListView.builder(
      itemCount: appHomeMenuItem.length,
      itemBuilder: ((context, index) {
        final homeMenuIndex = appHomeMenuItem[index];
        return GestureDetector(
          onTap: () => context.push(homeMenuIndex.url),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  homeMenuIndex.title,
                  style: titleStyleLarge,
                ),
                subtitle: Text(
                  homeMenuIndex.subtitle,
                  style: subtitleStyleSmall,
                ),
                trailing: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
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
      url: '/screen2',
      icon: Icons.abc),
  HomeMenuItem(
      title: 'Rutina de los 3 días.',
      subtitle: 'Rutina que te exigira dar lo maximo de ti .',
      url: '/runtina_3dias_screen',
      icon: Icons.abc),
];
