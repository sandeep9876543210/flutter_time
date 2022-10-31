import 'package:flutter/material.dart';
import 'world_time.dart';

class Home extends StatefulWidget {
  var name;
  var Url;

  Home({Key? key, this.name, this.Url}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<world_time> countrynames = [
    world_time('india', "indiaimage.jpg",'Asia/Kolkata'),
    world_time('Nepal', "nepalimage.png",'Asia/Kathmandu'),
    world_time('USA', "usaimage.jpg",'America/New_York'),
    world_time('Britain', "britainimage.png",'Europe/London'),
    world_time('Pakistan', "pakiimage.jpg",'Asia/Karachi'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
                        child: Text("Country names",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
                      ListView.builder(
                          itemCount: countrynames.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Card(
                              color: Colors.white70,
                              margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  side:const BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  )),
                              child: ListTile(
                                title: Center(
                                    child: Text(
                                        '${countrynames[index].location}')),
                                onTap: () {
                                  print(countrynames[index].location);
                             /*     String location=countrynames[index].location;
                                  String url=countrynames[index].Url;
                                  String api=countrynames[index].api;
                             Navigator.pop(context,{
                               location,url,api
                             });*/
                                },
                                leading: CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assents/${countrynames[index].Url}'),
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
