import 'package:blood_source/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Future signUpWithEmailAndPassword(String email, String password) async {
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

  updateUserDate(selectedDoc, newValues) async {
    Firestore.instance
        .collection('users')
        .document(selectedDoc)
        .updateData(newValues)
        .catchError((e) {
          print(e.toString());
    });
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
