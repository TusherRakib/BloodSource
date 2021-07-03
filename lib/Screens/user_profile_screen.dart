import 'package:blood_source/Screens/update_user_profile_screen.dart';
import 'package:blood_source/Widgets/CustomButton_widget.dart';
import 'package:blood_source/models/authentication.dart';
import 'package:blood_source/models/database_methods.dart';
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
  //Active Status
  String userLastDonatedDate="";
  String userActiveStatus="";

  final formkey = GlobalKey<FormState>();

  TextEditingController _lastDonatedController = new TextEditingController();

  AuthenticationService _authenticationService = new AuthenticationService();
  DatabaseMethod _databaseMethod = new DatabaseMethod();
  String _chosenActiveStatus;

  uploadActivityStatus() {
    Map<String, String> userDataMap = {
      "last_donated": _lastDonatedController.text.trim(),
      "active_status": _chosenActiveStatus
    };
    _databaseMethod.uploadUserActivityInfo(userDataMap);
  }

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

  fetchUserActiveStatus() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser();
    if (firebaseUser != null) {
      await Firestore.instance
          .collection("activity_status")
          .document(firebaseUser.uid)
          .get()
          .then((ds) {
        userLastDonatedDate = ds.data['last_donated'];
        userActiveStatus= ds.data['active_status'];
      }).catchError((e) {
        print(e.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    fetchUserActiveStatus();
    return Form(
      key: formkey,
      child: Scaffold(
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
                    builder: (BuildContext context) =>
                        new UpdateUserProfileScreen(
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
        body: SingleChildScrollView(
          child: Column(
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
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(35),
                  ),
                  color: Colors.grey,
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 80.0, 0.0, 0.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Last Donated On: ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          FutureBuilder(
                            future: fetchUserActiveStatus(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState !=
                                  ConnectionState.done) {
                                return Text('Loading Date',
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.black45));
                              } else {
                                return Text(userLastDonatedDate,
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.black45));
                              }
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Text(
                            'Active Status: ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          FutureBuilder(
                            future: fetchUserActiveStatus(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState !=
                                  ConnectionState.done) {
                                return Text('Loading Status',
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.black45));
                              } else {
                                return Text(userActiveStatus,
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.black45));
                              }
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 700,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(35),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                      child: TextFormField(
                        controller: _lastDonatedController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          icon: Icon(
                            Icons.date_range,
                            color: Colors.black,
                          ),
                          hintText: 'Last Donated',
                          hintStyle: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            border: Border.all(color: Colors.black45)),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 15,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 17.0),
                          child: DropdownButtonFormField<String>(
                            focusColor: Colors.white,
                            value: _chosenActiveStatus,
                            elevation: 0,
                            decoration: InputDecoration.collapsed(hintText: ''),
                            style: TextStyle(color: Colors.white),
                            iconEnabledColor: Colors.black,
                            items: <String>[
                              'Active',
                              'Inactive',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(color: Colors.black),
                                ),
                              );
                            }).toList(),
                            hint: Text(
                              "Active Status",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                _chosenActiveStatus = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: GestureDetector(
                        child: CustomButton(buttonText: "Save"),
                        onTap: () {
                          uploadActivityStatus();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
