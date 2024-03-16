// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
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
            Image.asset(
              'assets/logo(1).jpg',
              height: 200,
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
            Column(
              children: [
                const Text(
                  'Registro',
                  style: TextStyle(fontSize: 24),
                ),
                EmailTextField(emailController: _emailController),
                const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                FormBuilderTextField(
                  controller: _passwordController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  name: 'password',
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'password',
                      prefixIcon: Icon(Icons.key)),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: 'Contrasena requerido'),
                  ]),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
            OutlinedButton(
              onPressed: () {
                context.push('/');
              },
              child: const Text('Saltar inicio de sesion'),
            ),
            GestureDetector(
              onTap: _signUp,
              child: Container(
                child: Text('hola'),
                decoration: BoxDecoration(
                  color: Colors.red
                ),
              ),
            ),
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

    User? user = await _auth.singnUpWithEmailAndPassword(email, password);

    if (user != null) {
      print('El usuario inicio sesion correctamente');
      context.push('/');
    } else {
      print('No consiguio iniciar sesion');
    }
  }
}

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
    required TextEditingController emailController,
  }) : _emailController = emailController;

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      controller: _emailController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.emailAddress,
      name: 'email',
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Email',
          prefixIcon: Icon(Icons.person)),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: 'Usuario requerido'),
        FormBuilderValidators.email(errorText: 'Debe ingresar un correo valido')
      ]),
    );
  }
}
