import 'package:blood_source/Screens/dashboard_screen.dart';
import 'package:blood_source/Widgets/create_account_text.dart';
import 'package:blood_source/Widgets/forgot_password_text.dart';
import 'package:blood_source/Widgets/login_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 130, 10, 10),
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
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.mail,
                          color: Colors.grey,
                        ),
                        hintText: 'Email'),
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
                        hintText: 'Password'),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Align(alignment: Alignment.topRight, child: ForgotPassword()),
              SizedBox(height: 20.0),
              LoginButton(),
              //TODO Modify the padding with something else. Its a temporary fix
              SizedBox(height: 10.0),
              CreateAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
