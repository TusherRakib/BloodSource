import 'package:blood_source/Widgets/CustomButton_widget.dart';
import 'package:blood_source/models/authentication.dart';
import 'package:blood_source/models/database_methods.dart';
import 'package:flutter/material.dart';

class UpdateProfileScreen extends StatefulWidget {
  String fetchName;
  String fetchEmail;
  String fetchNumber;
  String fetchLocation;
  String fetchBloodGroup;

  UpdateProfileScreen({this.fetchName, this.fetchEmail, this.fetchNumber, this.fetchBloodGroup, this.fetchLocation});

  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final formkey = GlobalKey<FormState>();

  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _emailEditingController = new TextEditingController();
  TextEditingController _nameEditingController = new TextEditingController();
  TextEditingController _phoneNumberEditingController =
      new TextEditingController();
  String _chosenBloodGroup;
  String _chosenLocation;


  AuthenticationService _authenticationService = new AuthenticationService();
  DatabaseMethod _databaseMethod = new DatabaseMethod();

  @override
  Widget build(BuildContext context) {
    _nameEditingController.text = widget.fetchName;
    _emailEditingController.text= widget.fetchEmail;
    _phoneNumberEditingController.text= widget.fetchNumber;
    _chosenLocation = widget.fetchLocation;
    _chosenBloodGroup = widget.fetchBloodGroup;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 150, 10, 10),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Text(
                  'Update Information',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Material(
                  elevation: 2.0,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                    child: TextFormField(
                      controller: _nameEditingController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.account_circle_outlined,
                            color: Colors.grey,
                          ),
                          hintText: 'Name'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Name';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Material(
                  elevation: 2.0,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                    child: TextFormField(
                      controller: _emailEditingController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.mail,
                            color: Colors.grey,
                          ),
                          hintText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Email Address';
                        } else if (!value.contains('@')) {
                          return 'Invalid Email Address';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Material(
                  elevation: 2.0,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                    child: TextFormField(
                      controller: _phoneNumberEditingController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.phone,
                            color: Colors.grey,
                          ),
                          hintText: 'Phone'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Phone Number';
                        } else if (value.length < 11) {
                          return 'Invalid Phone Number';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 15,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0.0, top: 10.0),
                    child: Material(
                      elevation: 2.0,
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: DropdownButtonFormField<String>(
                            focusColor: Colors.white,
                            value: _chosenBloodGroup,
                            elevation: 2,
                            decoration: InputDecoration.collapsed(hintText: ''),
                            style: TextStyle(color: Colors.white),
                            iconEnabledColor: Colors.black,
                            items: <String>[
                              'A+',
                              'A-',
                              'B+',
                              'B-',
                              'AB+',
                              'AB-',
                              'O+',
                              'O-',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(color: Colors.black),
                                ),
                              );
                            }).toList(),
                            hint: Row(
                              children: [
                                Icon(Icons.bloodtype),
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "Blood Group",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            onChanged: (String value) {
                              setState(() {
                                _chosenBloodGroup = value;
                              });
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please Select Blood Group';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 15,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0.0, top: 10.0),
                    child: Material(
                      elevation: 2.0,
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: DropdownButtonFormField<String>(
                            focusColor: Colors.white,
                            value: _chosenLocation,
                            elevation: 2,
                            decoration: InputDecoration.collapsed(hintText: ''),
                            style: TextStyle(color: Colors.white),
                            iconEnabledColor: Colors.black,
                            items: <String>[
                              'Dhaka',
                              'Sylhet',
                              'Barishal',
                              'Chittagong',
                              'Rajshahi',
                              'Comilla',
                              'Mymensing',
                              'Rangpur',
                              'Khulna',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(color: Colors.black),
                                ),
                              );
                            }).toList(),
                            hint: Row(
                              children: [
                                Icon(Icons.location_on),
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "Location",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            onChanged: (String value) {
                              setState(() {
                                _chosenLocation = value;
                              });
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please Select Location';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),

                GestureDetector(
                  child: CustomButton(buttonText: "Update"),
                  onTap: () {

                  },
                ),
                //Navigate to Login Screen DONE
                SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
