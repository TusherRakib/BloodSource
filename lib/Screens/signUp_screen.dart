import 'package:blood_source/Widgets/CustomButton_widget.dart';
import 'package:blood_source/Widgets/login_text.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 200, 10, 10),
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
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.account_circle_outlined,
                          color: Colors.grey,
                        ),
                        hintText: 'Name'),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
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
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.phone,
                          color: Colors.grey,
                        ),
                        hintText: 'Phone'),
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
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              CustomButton(buttonText: "Sign Up"), //Navigate to Login Screen DONE
              SizedBox(height: 10.0),
              LoginText(),
            ],
          ),
        ),
      ),
    );
  }
}
