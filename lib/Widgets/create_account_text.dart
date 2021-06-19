import 'package:blood_source/Screens/signUp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Don't Have Account?",
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(
            text: "Create Account!",
            style: TextStyle(
              color: Colors.red,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SignIn(),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
