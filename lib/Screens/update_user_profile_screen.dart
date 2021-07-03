import 'package:blood_source/Screens/user_profile_screen.dart';
import 'package:blood_source/Widgets/CustomButton_widget.dart';
import 'package:blood_source/models/authentication.dart';
import 'package:blood_source/models/database_methods.dart';
import 'package:flutter/material.dart';

class UpdateUserProfileScreen extends StatefulWidget {
  String fetchName;
  String fetchEmail;
  String fetchNumber;
  String fetchLocation;
  String fetchBloodGroup;

  UpdateUserProfileScreen(
      {this.fetchName,
      this.fetchEmail,
      this.fetchNumber,
      this.fetchBloodGroup,
      this.fetchLocation});

  @override
  _UpdateUserProfileScreenState createState() =>
      _UpdateUserProfileScreenState();
}

class _UpdateUserProfileScreenState extends State<UpdateUserProfileScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController _nameEditingController = new TextEditingController();
  TextEditingController _phoneNumberEditingController =
      new TextEditingController();
  String _chosenBloodGroup;
  String _chosenLocation;

  DatabaseMethod _databaseMethod = new DatabaseMethod();

  UpdateUserData() {
    if (formKey.currentState.validate() || !formKey.currentState.validate()) {
      Map<String, String> userDataMap = {
        "name": _nameEditingController.text.trim(),
        "phone": _phoneNumberEditingController.text.trim(),
        "blood group": _chosenBloodGroup.trim(),
        "location": _chosenLocation.trim(),
      };

      _databaseMethod.upDateUserInfo(userDataMap);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => UserProfileScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 150, 10, 10),
          child: Form(
            key: formKey,
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
                          hintText: widget.fetchName),
                      // validator: (value) {
                      //   if (value.isEmpty) {
                      //     return 'Please Enter Name';
                      //   } else {
                      //     return null;
                      //   }
                      // },
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
                          hintText: widget.fetchNumber),
                      // validator: (value) {
                      //   if (value.isEmpty) {
                      //     return 'Please Enter Phone Number';
                      //   } else if (value.length < 11) {
                      //     return 'Invalid Phone Number';
                      //   } else {
                      //     return null;
                      //   }
                      // },
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
                                    widget.fetchBloodGroup,
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
                            // validator: (value) {
                            //   if (value.isEmpty) {
                            //     return 'Please Select Blood Group';
                            //   } else {
                            //     return null;
                            //   }
                            // },
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
                                    widget.fetchLocation,
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
                            // validator: (value) {
                            //   if (value.isEmpty) {
                            //     return 'Please Select Location';
                            //   } else {
                            //     return null;
                            //   }
                            // },
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
                    UpdateUserData();
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
