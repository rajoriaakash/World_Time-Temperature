import 'package:flutter/material.dart';
import 'package:world_time/services/world.dart';        //Dart file for Getting time and temp
import 'package:flutter_spinkit/flutter_spinkit.dart';  //Spinner

// ignore: camel_case_types
class Loading_Screen extends StatefulWidget {
  @override
  _Loading_ScreenState createState() => _Loading_ScreenState();
}

// ignore: camel_case_types
class _Loading_ScreenState extends State<Loading_Screen> {

  void setupWorld () async{

    World instance = World(location: 'Delhi, India', flag: 'india.png', url: '/Asia/Kolkata' , locationw: 'Delhi');
    await instance.getTimeTemp();
    print(instance.time);
    print(instance.Temp);
    Navigator.pushReplacementNamed(context, '/Home', arguments: {               //Sending info to home screen
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isMorning' : instance.isMorning,
      'isNoon' : instance.isNoon,
      'isEvening' : instance.isEvening,
      'isNight' : instance.isNight,
      'locationw' : instance.locationw,
      'Temp': instance.Temp,

    });

  }

  @override
  void initState() {
    super.initState();
    setupWorld();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade800,
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
