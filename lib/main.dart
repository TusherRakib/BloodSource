import 'package:blood_source/Screens/dashboard_screen.dart';
import 'package:blood_source/Screens/login_screen.dart';
import 'package:blood_source/Screens/signUp_screen.dart';
import 'package:blood_source/Screens/user_profile_new_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BloodSource());
}

class BloodSource extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Color(0xFFF3F3F3),
      ),

      home: LogInScreen(),
    );
  }
}
