import 'package:blood_source/Screens/dashboard_screen.dart';
import 'package:blood_source/Screens/login_screen.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String buttonText;
  CustomButton({this.buttonText});

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.redAccent,
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        child: Text(buttonText,style: TextStyle(color: Colors.white),),
        style: ElevatedButton.styleFrom(
            textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
