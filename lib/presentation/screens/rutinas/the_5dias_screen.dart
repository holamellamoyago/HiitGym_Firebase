import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:firebase/infrastructure/models/5dias_model.dart.dart';

class Rutina5Dias extends StatefulWidget {
  static const name = 'screen2';

  const Rutina5Dias({super.key});

  @override
  State<Rutina5Dias> createState() => _Rutina5DiasState();
}

class _Rutina5DiasState extends State<Rutina5Dias> {
  The5DiasModel? the5dias;

  @override
  void initState() {
    super.initState();
    get5dias();
  }

  Future<void> get5dias() async {
    final response = await Dio()
        .get('https://65eb7ba243ce16418933eaa1.mockapi.io/Rutinas/5Dias/1');

    the5dias = The5DiasModel.fromJson(response.data);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Esta es la Rutina 5 dias Screen'),
            Text(the5dias?.dia1Ejercicio1 ?? 'a'),
          ],
        ),
      ),
    );
  }
}
