import 'package:flutter/material.dart';

class BloodGroupSelector extends StatefulWidget {

  @override
  _BloodGroupSelectorState createState() => _BloodGroupSelectorState();
}

class _BloodGroupSelectorState extends State<BloodGroupSelector> {

  int selectedIndex = 0;
  final List groups = ['A+','A-','B+','B-','O+','O-','AB+','AB-',];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: groups.length,
          itemBuilder: (BuildContext context, int index){
            return GestureDetector(
                onTap: (){
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  color: index == selectedIndex? Colors.red : Colors.white,
                  height: .0,
                  width: 60.0,
                  child: Center(
                    child: Text(groups[index],style: TextStyle(
                        color: index == selectedIndex? Colors.white : Colors.black,
                        fontSize: 15.0,
                        //fontWeight: FontWeight.bold,
                        letterSpacing: 1.2
                    ),
                    ),
                  ),
                )
            );
          }
      ),
    );
  }
}
