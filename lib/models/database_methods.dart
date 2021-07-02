import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseMethod {
  uploadUserInfo(userDataMap) async {
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection("users")
        .document(firebaseUser.uid)
        .setData(userDataMap)
        .catchError((e) {
      print(e.toString());
    });
  }

  upDateUserInfo(userDataMap) async {
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection("users")
        .document(firebaseUser.uid)
        .updateData(userDataMap)
        .catchError((e) {
      print(e.toString());
    });
  }
}