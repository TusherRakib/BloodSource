import 'package:blood_source/Screens/dashboard_screen.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
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
              builder: (_) => Dashboard(),
            ),
          );
        },
        child: Text(
          'LOGIN',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
