import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};


  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;  //If data is empty , it gets data(Time and temp data)

    String bgimage;                                                              //Theming till Line 64
    Color bgcolor ;
    Color textcol;
    Color loincol;
    Color lobocol;
    Color tiincol;
    Color tibocol;

  if (data['isMorning'] == true) {
    bgimage = 'morning.jpg';
    bgcolor = Colors.blueAccent;
    textcol = Colors.black;
    loincol = Colors.pinkAccent[700].withOpacity(0.1);
    lobocol = Colors.pinkAccent[700].withOpacity(0.3);
    tiincol = Colors.purple[100].withOpacity(0.2);
    tibocol = Colors.purple[900].withOpacity(0.6);
  }

  else if (data['isNoon'] == true) {
    bgimage = 'noon.jpg';
    bgcolor = Colors.blueAccent;
    textcol = Colors.black;
    loincol = Colors.indigo.withOpacity(0.1);
    lobocol = Colors.indigo[700].withOpacity(0.2);
    tiincol = Colors.blueAccent[700].withOpacity(0.2);
    tibocol = Colors.blueAccent[700];
  }
  else if (data['isEvening'] == true) {
    bgimage = 'evening.jpg';
    bgcolor = Colors.blueAccent;
    textcol = Colors.black;
    loincol = Colors.indigo.withOpacity(0.1);
    lobocol = Colors.indigo[700].withOpacity(0.2);
    tiincol = Colors.purple[100].withOpacity(0.2);
    tibocol = Colors.purple[900];
  }
  else if (data['isNight'] == true) {
    bgimage = 'night.jpg';
    bgcolor = Colors.indigo;
    textcol = Colors.black;
    loincol = Colors.indigo[400].withOpacity(0.3);
    lobocol = Colors.indigo[700].withOpacity(0.5);
    tiincol = Colors.indigo[400].withOpacity(0.5);
    tibocol = Colors.indigo[900];
  }
  
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgimage'),
              fit:  BoxFit.fitHeight,
            ),

          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextButton.icon(                                              //Button to go to Choose Location page
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.teal,
                      onSurface: Colors.grey,
                    ),
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/Choose_Location');
                      setState(() {
                        data = {
                          'location' : result['location'],
                          'flag' : result['flag'],
                          'time' : result['time'],
                          'isMorning' : result['isMorning'],
                          'isNoon' : result['isNoon'],
                          'isEvening' : result['isEvening'],
                          'isNight' : result['isNight'],

                        };
                      });
                    },
                    icon: Icon(
                      Icons.location_on_outlined,
                      size: 20.0,
                      color: Colors.white,
                    ),
                    label: Text(
                        'Choose Location',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Image.asset('assets/${data['flag']}',
                    width: 50.0,
                    ),
                  SizedBox(height: 10.0),

                  Container(
                    decoration: BoxDecoration(
                      color: loincol,
                      border: Border.all(
                        color: lobocol,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Text(
                      data['location'],                                     //Displays location i.e selected or was by default
                      style: GoogleFonts.playfairDisplay(
                        color: textcol,
                        fontWeight: FontWeight.w500,
                        fontSize: 37.0,
                        letterSpacing: 1.2,
                      )
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Container(
                    decoration: BoxDecoration(
                      color: tiincol,
                        border: Border.all(
                          color: tibocol,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        data['time'],                                           //Dsiplays time of the given location
                        style: TextStyle(
                          color: textcol,
                            fontSize: 65.0,
                            letterSpacing: 3.0,
                            fontWeight: FontWeight.bold,
                          )
                        ),
                    ),
                  ),
                  SizedBox(height : 40.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.5),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child:Padding(
                            padding: const EdgeInsets.symmetric(vertical: 13.0 , horizontal : 8.0),
                            child: Column(
                              children: [
                                Text(
                                    'Temperature:',
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  data['Temp'] + ' °C',                         //Displays Temperature of the given location
                                  style: GoogleFonts.oxygen(
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.w400,
                                  )
                                  ),
                              ],
                            ),
                          ),

                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
