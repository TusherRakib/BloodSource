import 'package:blood_source/Screens/login_screen.dart';
import 'package:blood_source/Widgets/CustomButton_widget.dart';
import 'package:blood_source/Widgets/login_text.dart';
import 'package:blood_source/models/authentication.dart';
import 'package:blood_source/models/database_methods.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formkey = GlobalKey<FormState>();

  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _emailEditingController = new TextEditingController();
  TextEditingController _nameEditingController = new TextEditingController();
  TextEditingController _phoneNumberEditingController =
      new TextEditingController();

  AuthenticationService _authenticationService = new AuthenticationService();
  DatabaseMethod _databaseMethod = new DatabaseMethod();

  RegisterUser() async {
    dynamic result = await _authenticationService.signUpWithEmailAndPassword(
        _nameEditingController.text.trim(),
        _emailEditingController.text.trim(),
        _phoneNumberEditingController.text.trim(),
        _passwordController.text.trim());
    if (formkey.currentState.validate()) {
      if (result == null) {
        print('Email Invalid');
      } else {
        Map<String, String> userDataMap = {
          "name": _nameEditingController.text.trim(),
          "email": _emailEditingController.text.trim(),
          "phone": _phoneNumberEditingController.text.trim(),
          "password": _passwordController.text.trim(),
        };
        await _authenticationService
            .signUpWithEmailAndPassword(
                _nameEditingController.text.trim(),
                _emailEditingController.text.trim(),
                _phoneNumberEditingController.text.trim(),
                _passwordController.text.trim())
            .then((result) {
          _databaseMethod.uploadUserInfo(userDataMap);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Login()));
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 200, 10, 10),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text('Create A New Account',
                    style: TextStyle(color: Colors.grey[700])),
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
                      validator: (value) {
                        if (value.isEmpty && !value.contains('@')) {
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
                        if (value.isEmpty && value.length < 11) {
                          return 'Invalid Phone Number';
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
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.lock,
                            color: Colors.grey,
                          ),
                          hintText: 'Password'),
                      validator: (value) {
                        if (value.isEmpty || value.length < 6) {
                          return 'Invalid Password';
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
                      obscureText: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.lock,
                            color: Colors.grey,
                          ),
                          hintText: 'Confirm Password'),
                      validator: (value) {
                        if (value.isEmpty ||
                            value != _passwordController.text.trim()) {
                          return 'Please Not Matched';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                GestureDetector(
                  child: CustomButton(buttonText: "Sign Up"),
                  onTap: () {
                    RegisterUser();
                  },
                ),
                //Navigate to Login Screen DONE
                SizedBox(height: 10.0),
                LoginText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
