import 'package:firebase_auth/firebase_auth.dart';

abstract class Authuserfairbases {
  static Future<void> login({
    required String email,
    required String password,
  }) async {
    final firaebase = FirebaseAuth.instance;

    try {
      await firaebase.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }
}
