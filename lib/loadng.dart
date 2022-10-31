import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'world_time.dart';
import 'home.dart';
import 'Hello _page.dart';

class Loading extends StatefulWidget {
  Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "";
  String countryname = ".....";
  String hours = '';
   bool daytime=false;
   String bgimage="";
  void loadtime() async {
    world_time worldtime = world_time('India', 'indiaimage.jpg','Asia/Kolkata');
    await worldtime.getapi();
    setState(() {
      time = worldtime.clock;
      countryname = worldtime.location;
      hours = worldtime.hours;
      daytime = (hours == 7|8|9|10|11 | 12| 13 | 14|16|17|18) ? false : true;
      print(daytime);
    });
  }

// String datetime=body['datetime'];
//  print(datetime);

  @override
  void initState() {
    loadtime();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     bgimage = daytime ? 'day.png' : 'night.png';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(

          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assents/$bgimage'),
              fit: BoxFit.cover
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 130, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                      /*  Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return Home(
                            name: 'hyd',
                            Url: 'europe/berlin',
                          );
                        }));*/
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                          return Hello_page();
                        }));
                      },
                      child: Text('Home page')),
                  Text(
                    countryname,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    '' + time,
                    style: TextStyle(fontSize: 60, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),


        ),
      ),
    );
  }
}
