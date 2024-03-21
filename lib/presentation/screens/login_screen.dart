import 'package:firebase/configure/auth/auth.dart';
import 'package:firebase/presentation/preferences/pref_usuarios.dart';
import 'package:firebase/presentation/util/TextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase/presentation/util/snackbar.dart';

class LoginPage extends StatefulWidget {
  static const name = 'login_screen';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseauthService _auth = FirebaseauthService();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo(1).jpg',
              height: 200,
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
            EmailTextField(emailController: _emailController),
            const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
            PasswordTextField(passwordController: _passwordController),
            const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(
                    onPressed: () {
                      context.push('/register_screen');
                    },
                    child: const Text('Registro')),
                FilledButton(
                    onPressed: () {
                      _sigIn();
                    },
                    child: const Text('Iniciar sesion')),
              ],
            ),
            FilledButton(
                onPressed: () async {
                  try {
                    final user = await _auth.loginGoogle();
                    if (user != null) {
                      context.go('/');
                    }
                  } on FirebaseAuthException catch (e) {
                    print(e.message);
                    // showSnackBar(context, e.message?? 'Algo salio mal');
                  }
                },
                child: const Text('Google'))
          ],
        )),
      ),
    );
  }

  void _sigIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    var prefs = PreferenciasUsuario();

    User? user = await _auth.sigInWithEmailAndPassword(email, password);

    if (user != null) {
      print('El usuario inicio sesion correctamente');
      context.push('/');
      prefs.ultimaPagina = '/';
      prefs.ultimouid = user.uid;
      showSnackBar(context, 'Inicio sesion correctamente');
    } else {
      print('No consiguio iniciar sesion');
      showSnackBar(context, 'Error de contraseña o mail ');
    }
  }

  void _sigInGoogle() async {

  }
}
