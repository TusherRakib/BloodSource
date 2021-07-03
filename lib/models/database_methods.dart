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

  uploadUserActivityInfo(userDataMap) async {
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection("activity_status")
        .document(firebaseUser.uid)
        .setData(userDataMap)
        .catchError((e) {
      print(e.toString());
    });
  }

  // getCurrentUserInfo()async {
  //   final firebaseUser = await FirebaseAuth.instance.currentUser();
  //   if (firebaseUser != null) {
  //     await Firestore.instance
  //         .collection("users")
  //         .document(firebaseUser.uid)
  //         .get();
  //   }
  // }

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