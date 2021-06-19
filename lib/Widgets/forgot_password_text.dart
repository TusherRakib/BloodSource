import 'package:blood_source/Screens/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
      text: "Forgot Password",
      style: TextStyle(color: Colors.red),
      recognizer: TapGestureRecognizer()
        ..onTap = () => Fluttertoast.showToast(
            msg: "FORGOT PASSWORD",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0),

      //TODO Implement Method
    ));
  }
}
