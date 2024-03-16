import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase/presentation/util/snackbar.dart';

class LoginPage extends StatelessWidget {
  static const name = 'login_screen';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/logo(1).jpg',
            height: 200,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
          const _Mail_and_Password(),
          const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
          OutlinedButton(
            onPressed: () {
              context.push('/');
            },
            child: const Text('Saltar inicio de sesion'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          FilledButton(
              onPressed: () {
                context.push('/register_screen');
              },
              child: const Text('Registro')),
          FilledButton(
              onPressed: () {
                context.push('/');
              },
              child: const Text('Iniciar sesion')),
            ],
          ),

          ElevatedButton(
              onPressed: () {
                showSnackBar(context, 'Estamos mostrando un mensaje');
              },
              child: const Text('SnackBar'))
        ],
      )),
    );
  }
}

class _Mail_and_Password extends StatelessWidget {
  const _Mail_and_Password();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        width: 300,
        child: Column(
          children: [
            Text(
              'Login',
              style: TextStyle(fontSize: 24),
            ),
            TextField(
              autocorrect: true,
              obscureText: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Email'),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 4)),
            TextField(
              autocorrect: true,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Password'),
            ),
          ],
        ));
  }
}
