import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time/services/world.dart';


class Choose_Location extends StatefulWidget {
  @override
  _Choose_LocationState createState() => _Choose_LocationState();
}

class _Choose_LocationState extends State<Choose_Location> {
  List <World> locations = [                                                                    //List of locations to be shown on this page
    World(url: 'Asia/Kolkata', location: 'Delhi, India', flag: 'india.png',locationw: 'Delhi'),
    World(url: 'Europe/London', location: 'London, UK', flag: 'london.png',locationw: 'London'),
    World(url: 'Europe/Paris', location: 'Paris, France', flag: 'paris.png',locationw: 'Paris'),
    World(url: 'Asia/Tokyo', location: 'Tokyo, Japan', flag: 'tokyo.png',locationw: 'Tokyo'),
    World(url: 'Europe/Rome', location: 'Rome, Italy', flag: 'rome.png',locationw: 'Rome'),
    World(url: 'Asia/Dubai', location: 'Dubai, UAE', flag: 'dubai.png',locationw: 'Dubai'),
    World(url: 'Asia/Singapore', location: 'Singapore', flag: 'singapore.png',locationw: 'Singapore'),
    World(url: 'America/New_York', location: 'New York, USA', flag: 'newyork.png',locationw: 'New York'),
    World(url: 'Europe/Moscow', location: 'Moscow, Russia', flag: 'moscow.png',locationw: 'Moscow'),
    World(url: 'Australia/Sydney', location: 'Sydney, Australia', flag: 'sydney.png',locationw: 'Sydney'),
    World(url: 'Asia/Hong_Kong', location: 'Hong Kong, China', flag: 'hongkong.png',locationw: 'Hong Kong'),
    World(url: 'Europe/Athens', location: 'Athens, Greece', flag: 'athens.png',locationw: 'Athens'),
  ];

  void updatetime(index) async {
    World instance = locations[index];
    await instance.getTimeTemp();                               //Gets time for chosen location
    // Navigate to home screen
    Navigator.pushReplacementNamed(context, '/Home', arguments:{    //sends data to homescreen to display
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isMorning': instance.isMorning,
      'isNoon' : instance.isNoon,
      'isEvening' : instance.isEvening,
      'isNight' : instance.isNight,
      'locationw' : instance.locationw,
      'Temp': instance.Temp,

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.greenAccent[100],

        title: Text(
            'Choose a location',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,

      ),
      body: ListView.builder(                             //Builds a list
          itemCount: locations.length ,
          itemBuilder: (context,index) {
            return Card(                                  //Card Template
              child: ListTile(
                tileColor: Colors.tealAccent[100],
                onTap: () {
                  updatetime(index);                      //Calls the function to get time for chosen location

                },
                title: Text(
                    locations[index].location,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                leading: CircleAvatar(                   //Displays flag with name
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  radius: 20,
                ),

              ),
            );

          }
      )
    );
  }
}
