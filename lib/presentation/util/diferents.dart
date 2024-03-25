import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/presentation/preferences/pref_usuarios.dart';
import 'package:flutter/material.dart';

class ImagenLogo extends StatelessWidget {
  const ImagenLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/logo(1).jpg',
      height: 200,
    );
  }
}


class CardHomeScreen extends StatelessWidget {
  const CardHomeScreen({
    super.key,
    required this.title1,
    required this.subtitle1,
    required this.icon1,
  });

  final String title1;
  final String subtitle1;
  final IconData icon1;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Card.filled(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        child: Column(
          children: [
            Text(
              title1,
              style: const TextStyle(fontSize: 24),
            ),
            Text(subtitle1),
            Icon(
              icon1,
              size: 50,
            )
          ],
        ),
      ),
    ));
  }
}


class GetUsername extends StatelessWidget {
  const GetUsername({
    super.key,
    required this.prefs,
    required this.colors,
  });

  final PreferenciasUsuario prefs;
  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('User')
            .doc(prefs.ultimouid)
            .get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          } else {
            final _data = snapshot.data?.data();
            if (_data!.isNotEmpty) {
              return Text(
                _data['username'],
                style: TextStyle(fontSize: 42, color: colors.primary),
              );
            }
            return Placeholder();
          }
        });
  }
}