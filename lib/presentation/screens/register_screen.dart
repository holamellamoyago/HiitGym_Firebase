// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/presentation/preferences/pref_usuarios.dart';
import 'package:firebase/presentation/util/TextField.dart';
import 'package:firebase/presentation/util/diferents.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase/configure/auth/auth.dart';
import 'package:firebase/presentation/util/snackbar.dart';

class RegisterScreen extends StatefulWidget {
  static const name = 'register_screen';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final FirebaseauthService _auth = FirebaseauthService();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ImagenLogo(),
            const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
            Column(
              children: [
                const Text(
                  'Registro',
                  style: TextStyle(fontSize: 24),
                ),
                EmailTextField(emailController: _emailController),
                const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                PasswordTextField(passwordController: _passwordController),
              ],
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
            FilledButton(
                onPressed: _signUp, child: const Text('Crear nueva cuenta')),
            ElevatedButton(
                onPressed: () {
                  showSnackBar(context, 'Estamos mostrando un mensaje');
                },
                child: const Text('SnackBar'))
          ],
        ),
      ),
    );
  }

  void _signUp() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    var prefs = PreferenciasUsuario();

    User? user = await _auth.createAcountWithEmailAndPassword(email, password);

    if (user != null) {
      print('El usuario inicio sesion correctamente');
      context.push('/');
      prefs.ultimouid = user.uid;
      FirebaseFirestore.instance
          .collection('User')
          .doc(user.uid).set
          
          
          ({'email': email, 'password': password});
    } else {
      print('No consiguio iniciar sesion');
    }
  }
}
