import 'package:flutter/material.dart';
import 'package:world_time/pages/homescreen.dart';           //Home Screen dart file
import 'package:world_time/pages/loadingscreen.dart';        //Loading Screen dart file
import'package:world_time/pages/chooseloc.dart';             // Location Choosing Screen dart file

void main() {
  runApp(MaterialApp(
    initialRoute: '/',                                        //Routing our app
    routes: {
      '/' : (context) => Loading_Screen(),
      '/Home' : (context) => Home(),
      '/Choose_Location' : (context) => Choose_Location(),
    },

  ));
}

