import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Authentication {
  final String email;
  final String password;
  FirebaseAuth _firebaseAuth;

  Authentication(this._firebaseAuth, this.email, this.password);
  // 2
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // 3
  Future<bool> signIn() async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      print("Succesfully loggedIn\n");
      return true;
    } on FirebaseAuthException catch (e) {
      print("//-------------- gadbad----------$e----//\n\n");
      return false;
    }
  }

  // 4
  Future<String> signUp() async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
  }

  // 5

  Future<bool> checkIfEmailInUse() async {
    try {
      // Fetch sign-in methods for the email address
      final list =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);

      // In case list is not empty
      if (list.isNotEmpty) {
        // Return true because there is an existing
        // user using the email address

        return signIn();
      } else {
        // Return false because email adress is not in use
        print("//-------------- kay kela re --------///\n\n");
        return false;
      }
    } catch (error) {
      // Handle error
      // ...
      print(error.toString());
      return false;
    }
  }
}
