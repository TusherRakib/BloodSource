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
        backgroundColor: Color(0xFFF9BD7E),
        elevation: 0.0,
        leading: Icon(Icons.menu),
        actions: [
          Icon(Icons.search),
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color(0xFFF9BD7E),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                ),
            ),
            height: 150,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
               CircleAvatar(
                   radius: 35.0,
                   backgroundImage: AssetImage('assets/images/user_default.png')
               ),
                 SizedBox(width: 20.0,),
                 Padding(
                   padding: const EdgeInsets.only(top: 45.0),
                   child: Column(
                     children: [
                       Text("Rafid Hussain Khan",style: TextStyle(fontSize: 35.0,fontWeight: FontWeight.w900),),
                       Text("App Developer",style: TextStyle(fontSize: 20.0,color: Colors.black45),),
                     ],
                   ),
                 ),
               ],
             ),
            //Center(
            //   child: ListTile(
            //     title: Text("Rafid Hussain Khan",style: TextStyle(fontSize: 35.0,fontWeight: FontWeight.bold),),
            //     subtitle: Text("App Developer"),
            //     leading: CircleAvatar(
            //         backgroundImage: AssetImage('assets/images/user_default.png')),
            //     //isThreeLine: true,
            //   ),
            // ),
          )
        ],
      ),
    );
  }
}
