import 'package:blood_source/Screens/update_profile_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  String userName = "";
  String userEmail = "";
  String userPhone = "";
  String userBloodGroup = "";
  String userLocation = "";

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
        userBloodGroup = ds.data['blood group'];
        userLocation = ds.data['location'];
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              ),
              onPressed: () {
                var route = new MaterialPageRoute(
                  builder: (BuildContext context) => new UpdateProfileScreen(
                    fetchName: userName,
                    fetchEmail: userEmail,
                    fetchNumber: userPhone,
                    fetchBloodGroup: userBloodGroup,
                    fetchLocation: userLocation,
                  ),
                );
                Navigator.of(context).push(route);
              },
            ),
          ),
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
                    backgroundImage:
                        AssetImage('assets/images/user_default.png')),
                SizedBox(
                  width: 20.0,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 45.0),
                  child: Column(
                    children: [
                      // Text("Rafid Hussain Khan",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w900),),
                      // Text("App Developer",style: TextStyle(fontSize: 20.0,color: Colors.black45),),
                      FutureBuilder(
                        future: fetchUserData(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState !=
                              ConnectionState.done) {
                            return Text('Loading Name',
                                style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w900));
                          } else {
                            return Text(userName,
                                style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w900));
                          }
                        },
                      ),

                      FutureBuilder(
                        future: fetchUserData(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState !=
                              ConnectionState.done) {
                            return Text('Loading Blood Group',
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.black45));
                          } else {
                            return Text("Blood Group: " + userBloodGroup,
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.black45));
                          }
                        },
                      )
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
