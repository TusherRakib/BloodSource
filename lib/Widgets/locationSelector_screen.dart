import 'package:blood_source/elements/strings.dart';
import 'package:flutter/material.dart';

class LocationSelector extends StatefulWidget {

  @override
  _LocationSelectorState createState() => _LocationSelectorState();
}

class _LocationSelectorState extends State<LocationSelector> {


  List _locations = ['Dhaka','Barisal','Comilla','Rajshahi','Sylhet','Narayanganj','Rangpur','Cittagong',];
  String _selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      child: Container(
        padding: EdgeInsets.all(10.0),
        height: 50.0,
        width: 250.0,
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            hint:Text(
              "Please choose a Location",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ), // Not necessary for Option 1
            value: _selectedLocation,
            iconEnabledColor:Colors.black,
            onChanged: (newValue) {
              setState(() {
                _selectedLocation = newValue;
              });
            },
            items: _locations.map((location) {
              return DropdownMenuItem(
                child: Text(
                  location,
                  style:TextStyle(
                      color:Colors.black,
                  fontSize: 18.0),
                ),
                value: location,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
