import 'package:blood_source/Widgets/CustomButton_widget.dart';
import 'package:blood_source/Widgets/bloodGroupSelector_widget.dart';
import 'package:blood_source/Widgets/locationSelector_screen.dart';
import 'package:blood_source/main.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    var val = "Search Donor";
    return Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        /*appBar: AppBar(
        backgroundColor: Color(0xFFDE2C2C),
        leading: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: (){},
        ),
        title: Center(
          child: Text('BloodSource',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: (){},
          ),
        ],
      ),*/
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20,70,20,20),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Find Donor',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text('Search For Blood Donor around you',style: TextStyle(
                    fontSize: 18.0,
                ),
                ),
                SizedBox(height: 30.0,),
                Text('Choose Blood Group',style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 10.0,),
                Material(
                  elevation: 2.0,
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0),),
                      ),

                    child: BloodGroupSelector(),
                  ),
                ),
                SizedBox(height: 30.0,),
                Text('Choose location',style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 10.0,),
                LocationSelector(),
                SizedBox(
                  height: 20,
                ),
                CustomButton(buttonText: "Search Donor"),
              ],
            ),
          ),
        ),
      )
    );
  }
}