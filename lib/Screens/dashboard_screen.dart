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
    return Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        appBar: AppBar(
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
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Find Donor',
                  style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
                ),
                ),
                Text('Search For Blood Donor around you'),
                SizedBox(height: 30.0,),
                Text('Chooose Blood Group'),
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
                Text('Chooose location'),
                SizedBox(height: 10.0,),
                LocationSelector(),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}