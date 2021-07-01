import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String userName = "";
  String userEmail = "";
  String userPhone = "";

  fetchUserData() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser();
    if (firebaseUser != null) {
      await Firestore.instance
          .collection("users")
          .document(firebaseUser.uid)
          .get()
          .then((ds) {
        userEmail = ds.data['email'];
        userName = ds.data['name'];
        userPhone = ds.data['phone'];
      }).catchError((e) {
        print(e.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 0.0,
        leading: Icon(Icons.menu),
        actions: [
          Icon(Icons.search),
        ],
      ),
      body: Column(
        children: [
          Card(
            color: Colors.redAccent,
            child: ListTile(
              title: Text("Rafid Hussain Khan"),
              subtitle: Text("App Developer"),
              leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/user_default.png')),
              //isThreeLine: true,
            ),
          )
        ],
      ),
    );
  }
}
