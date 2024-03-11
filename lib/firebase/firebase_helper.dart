import 'package:firebase_auth/firebase_auth.dart';

class FireBaseHelper {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<bool> signUp(String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return false;
    } catch (e) {
      return false;
      print(e);
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      // Sign in the user with email and password
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // If sign in successful, return true
      return true;
    } catch (e) {
      // If sign in fails, print the error message and return false
      print("Login failed: $e");
      return false;
    }
  }
}
