import 'package:dio/dio.dart';
import 'package:firebase/infrastructure/models/5dias_model.dart.dart';

The5DiasModel? the5dias;

Future<void> get5dias() async {
  final response = await Dio()
      .get('https://65eb7ba243ce16418933eaa1.mockapi.io/Rutinas/5Dias/1');

  the5dias = The5DiasModel.fromJson(response.data);

}
