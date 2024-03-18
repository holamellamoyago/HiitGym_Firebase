import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required TextEditingController passwordController,
  }) : _passwordController = passwordController;

  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      controller: _passwordController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      name: 'password',
      obscureText: true,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'password',
          prefixIcon: Icon(Icons.key)),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
            errorText: 'Contrasena requerido'),
      ]),
    );
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