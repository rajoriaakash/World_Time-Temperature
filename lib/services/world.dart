import  'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

class World{
  //for time app
  String location;  //Location name for user
  String time;      //time in location
  String flag;      //url for flag
  String url;       //location url for api endpoints

  //for weather app
  String key = "eb17a32c7e775b86ae35c1ab238212d9";     //Weather API key
  String locationw;                                    //Location name for Weather API
  String Temp;                                         //Temperature at location

  //checks time for background image
  bool isMorning;                                      // Variable to check if is is MORNING
  bool isNoon;                                         //                            NOON
  bool isEvening;                                      //                            EVENING
  bool isNight;                                        //                            NIGHT

  World({this.location, this.flag , this.url,this.locationw});                    //Constructor

  Future<void> getTimeTemp() async {                                             //async function to get time and temperature
    try{
      var urltemp = Uri.parse('https://worldtimeapi.org/api/timezone/$url');    //gets time from API
      http.Response response = await http.get(urltemp);
      Map data = jsonDecode(response.body);                                     //converts json into map

      //fetches weather data

      WeatherFactory wf = new WeatherFactory(key);                               //new WeatherFactory variable to run a function on
      Weather w = await wf.currentWeatherByCityName(location);                   //gets Weather from API
      Temp = w.temperature.celsius.toString();                                   //gets Temperature from weather
      Temp = Temp.substring(0,4);
      //gets numeral value of Temp
      //changes datetime data to strings
      String datetime = data['datetime'];
      String offsetsign = data['utc_offset'].substring(0,1);                     //gets offset sign
      String offset1 = data['utc_offset'].substring(1,3);                        //offset in hours
      String offset2 = data['utc_offset'].substring(4,6);                        //offset in minutes


      //creating a DateTime object
      DateTime now = DateTime.parse(datetime);
      if(offsetsign == '-'){
        now = now.subtract(Duration(hours: int.parse(offset1),minutes: int.parse(offset2)));  //subtracts negative offset
      }
      else if(offsetsign == '+'){
        now = now.add(Duration(hours: int.parse(offset1),minutes: int.parse(offset2)));       //adds positive offset
      }


      isMorning = now.hour >= 6 && now.hour < 10 ? true : false ;           //Checks for morning
      isNoon = now.hour >= 10 && now.hour < 18 ? true : false ;             //Noon
      isEvening = now.hour >= 18 && now.hour < 20 ? true : false ;          //Evening
      isNight = now.hour >=20 || now.hour < 6 ? true : false ;              //Night

      //set time into a User friendly format
      time = DateFormat.jm().format(now);              //Changes format into user readable format
    }
    catch (e) {
      print('found the error $e');
      time = 'Could not get time data';
    }

  }
}