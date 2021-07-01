import 'package:blood_source/Screens/login_screen.dart';
import 'package:flutter/material.dart';

class SignUpBtn extends StatefulWidget {
  @override
  _SignUpBtnState createState() => _SignUpBtnState();
}

class _SignUpBtnState extends State<SignUpBtn> {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 380,
      child: ElevatedButton(
        style: ButtonStyle(),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => LogInScreen(),
            ),
          );
        },
        child: Text(
          'SIGN UP',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
