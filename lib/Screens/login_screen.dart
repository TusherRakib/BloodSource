import 'package:blood_source/Screens/dashboard_screen.dart';
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
      body: Padding(
        padding:
            EdgeInsets.only(top: 35.0, bottom: 20.0, left: 10.0, right: 10.0),
        child: Column(
          children: [
            Container(
                height: 280,
                width: 200,
                child: SvgPicture.asset(
                  'assets/images/logo.svg',
                  fit: BoxFit.cover,
                )),
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
            TextFormField(
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  icon: Icon(
                    Icons.mail,
                    color: Colors.grey,
                  ),
                  labelText: 'Email'),
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  icon: Icon(
                    Icons.lock,
                    color: Colors.grey,
                  ),
                  labelText: 'Password'),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Dashboard(),
                    ),
                  );
                },
                child: Text(
                  'Log IN',
                  style: TextStyle(fontSize: 20.0),
                ))
          ],
        ),
      ),
    );
  }
}
