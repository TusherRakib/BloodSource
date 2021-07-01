import 'package:blood_source/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Future signUpWithEmailAndPassword(
      String name, String email, String phoneNumber, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser firebaseUser = result.user;

      return firebaseUser;
    } catch (e) {
      print(e.toString());
    }
  }

  Future logInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser firebaseUser = result.user;

      return firebaseUser;
    } catch (e) {
      print(e.toString());
    }
  }

  Future signOut() async {
    try {
      print('logout');
      return _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

}