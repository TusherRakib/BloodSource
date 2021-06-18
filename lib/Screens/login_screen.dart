import 'package:blood_source/Screens/dashboard_screen.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Image.asset('assets/images/user_default.png'), //TODO image unloading
            Image.asset('assets/images/user_profile_pic_default.jpg'), //TODO image unloading
            Text('Hello'),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder:(_) => Dashboard(),
                  ),
                  );
                },
                child: Text('Log IN',style: TextStyle(fontSize: 20.0),)
            )
          ],
        ),
      ),
    );
  }
}
