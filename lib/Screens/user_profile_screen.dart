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
      appBar: AppBar(title: Text(userName), automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0.0,10.0,10.0,10.0),
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(30.0, 100.0, 0.0, 0.0),
                  child: Row(
                    children: [
                      Text(
                        'Name: ',
                        style: TextStyle(fontSize: 15.0),
                      ),
                      FutureBuilder(
                        future: fetchUserData(),
                        builder: (context, snapshot){
                          if(snapshot.connectionState!= ConnectionState.done)
                          {
                            return Text('Loading Name',style: TextStyle(fontSize: 15.0),);
                          }
                          else{
                            return Text(userName, style: TextStyle(fontSize: 15.0),);
                          }
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
                  child: Row(
                    children: [
                      Text(
                        'Email Address: ',
                        style: TextStyle(fontSize: 15.0),
                      ),
                      FutureBuilder(
                        future: fetchUserData(),
                        builder: (context, snapshot){
                          if(snapshot.connectionState!= ConnectionState.done)
                          {
                            return Text('Loading Email',style: TextStyle(fontSize: 15.0),);
                          }
                          else{
                            return Text(userEmail, style: TextStyle(fontSize: 15.0),);
                          }
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20.0,),
                Padding(
                  padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
                  child: Row(
                    children: [
                      Text(
                        'Phone Number: ',
                        style: TextStyle(fontSize: 15.0),
                      ),
                      FutureBuilder(
                        future: fetchUserData(),
                        builder: (context, snapshot){
                          if(snapshot.connectionState!= ConnectionState.done)
                          {
                            return Text('Loading Phone Number',style: TextStyle(fontSize: 15.0),);
                          }
                          else{
                            return Text(userPhone, style: TextStyle(fontSize: 15.0),);
                          }
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
