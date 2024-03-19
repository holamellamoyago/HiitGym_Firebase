import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  //Generar la instancia.
  static late SharedPreferences prefs;

  //Inicializar las preferencias
  static Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  String get ultimaPagina {
    return prefs.getString('name') ?? '/testing_screen';
  }

  set ultimaPagina(String value) {
    prefs.setString('name', value);
  }

  String get ultimouid {
    return prefs.getString('ultimouid') ?? '';
  }

    set ultimouid(String value) {
    prefs.setString('ultimouid', value);
  }
  String get username {
    return prefs.getString('username') ?? '';
  }

    set username(String value) {
    prefs.setString('username', value);
  }
}
