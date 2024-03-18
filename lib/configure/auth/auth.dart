import 'package:firebase_auth/firebase_auth.dart';

class FirebaseauthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> createAcountWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print('Some error');
    }
    return null;
  }

  Future<User?> sigInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Some error aa 2");
    }
    return null;
  }
}






// import 'package:firebase_auth/firebase_auth.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future createAcount(String email, String password) async {
//     try {
//       UserCredential userCredential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password);
//       print(userCredential.user);
//       //Cuando le ponemos un "?" es para decirle que no viene nulo.
//       return (userCredential.user?.uid);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('Contrasena muy debil');
//         return 1;
//       } else if (e.code == 'email-alredy-in-use') {
//         print('La cuenta ya existe para este email');
//         return 2;
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

// //Todos los future son  !!!ASYNC !!!! Y AWAIT!!!
//   Future sigInEmailAndPassword(String email, String password) async {
//     try {
//       UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//           email: email, password: password);

//       final a = userCredential.user;

// //Esto es por si Firebase peta y crea mal su ID del usuario, esto al ser diferente a null te devolvera de los que existen, no del error
//       if (a?.uid != null) {
//         return a?.uid;
//       }
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         print('El usuario no existe');
//         return 1;
//       } else if (e.code == 'wrong-password') {
//         print('Wrong password');
//         return 2;
//       }
//     }
//   }
// }

// class GetUserProfile {
//   final user = FirebaseAuth.instance.currentUser;

//   Future getInformation() async {
//     if (user != null) {
//       final name = user?.displayName;
//       final email = user?.email;
//       final photoURL = user?.photoURL;
//       final uid = user?.uid;
//     }
//   }
// }
