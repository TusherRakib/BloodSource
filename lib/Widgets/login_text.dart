import 'package:blood_source/Screens/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginText extends StatefulWidget {
  @override
  _LoginTextState createState() => _LoginTextState();
}

class _LoginTextState extends State<LoginText> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        text: "Already Have An Account?",
        children: <TextSpan>[
          TextSpan(
            text: "Login",
            style: TextStyle(
              color: Colors.red,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => LogInScreen(),
                ),
              ),
          ),
        ],
      ),
    );
  }
}
