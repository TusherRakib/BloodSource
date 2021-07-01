import 'package:blood_source/Screens/dashboard_screen.dart';
import 'package:blood_source/Widgets/CustomButton_widget.dart';
import 'package:blood_source/Widgets/create_account_text.dart';
import 'package:blood_source/Widgets/forgot_password_text.dart';
import 'package:blood_source/models/authentication.dart';
import 'package:blood_source/models/database_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final formkey = GlobalKey<FormState>();

  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _emailEditingController = new TextEditingController();

  AuthenticationService _authenticationService = new AuthenticationService();
  DatabaseMethod _databaseMethod = new DatabaseMethod();

  void LoginUser() async {
    dynamic authResult = await _authenticationService.logInWithEmailAndPassword(
        _emailEditingController.text.trim(), _passwordController.text.trim());
    if (authResult == null) {
      print("Sign In Error");
    } else {
      _emailEditingController.clear();
      _passwordController.clear();
      print("Login Succesfull");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => Dashboard(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 130, 10, 10),
          child: Form(
            child: Column(
              children: [
                Container(
                    height: 210,
                    width: 200,
                    child: SvgPicture.asset(
                      'assets/images/logo.svg',
                      fit: BoxFit.cover,
                    )),
                SizedBox(height: 40.0),
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Sign to continue',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                SizedBox(height: 10),
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
                SizedBox(height: 10.0),
                Align(alignment: Alignment.topRight, child: ForgotPassword()),
                SizedBox(height: 20.0),
                GestureDetector(
                  child: CustomButton(buttonText: "Log In"),
                  onTap: () {
                    LoginUser();
                  },
                ), //Navigate to Dashboard DONE
                SizedBox(height: 10.0),
                CreateAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
