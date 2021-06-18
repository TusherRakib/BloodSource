import 'package:blood_source/Screens/dashboard_screen.dart';
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
        accentColor: Color(0xFFFEF9EB),
      ),
      home: Dashboard(),
    );
  }
}
