import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
class Hello_page extends StatefulWidget {
  const Hello_page({Key? key}) : super(key: key);

  @override
  State<Hello_page> createState() => _Hello_pageState();
}

class _Hello_pageState extends State<Hello_page> {
  List<dynamic>dataResponse=[];
  String name="";

  Future<void> apicalls() async {
    Response response = await get(
      Uri.parse("https://api.homeocare.in/APP/BranchesAPP/GetStatesList"),
    );
    if (response.statusCode == 200) {
      Map mapResorse = json.decode(response.body);
      setState(() {
      //  msg = mapResorse['msg'];
        dataResponse = mapResorse['states'];
      });
    }
  }
List<dynamic>Branches=[];
  Future<void> apicallss() async {
  //  print("ints>>>>>" + ids.toString());
    Response response = await get(
      Uri.parse(
          "https://api.homeocare.in/APP/BranchesAPP/GetBranchesListByState?StateId=1"),
    );
    if (response.statusCode == 200)
      setState(() {
        Map mapResorse = json.decode(response.body);

        Branches = mapResorse['branches'];
        print(">>>>>${Branches.length}");
      //  openDailogs(context);
      });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            ElevatedButton(onPressed: (){


              showDialog(context: context, builder: (BuildContext context) => AlertDialog(
                  insetPadding: EdgeInsets.all(20),
                  actions: <Widget>[
                    Column(
                      children: [
                        Container(
                          width: double.maxFinite,
                          height: 60,
                          color: Colors.blue[200],child: Center(child: Text('Do you have Promocode?',style: TextStyle(fontSize: 20),)),),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(50,30,50,10),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  TextField(
                                    onChanged: (value){
                                      setState(() {

                                      });
                                    },
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        hintText: 'Enter Promocode',
                                        hintStyle: TextStyle(color: Colors.blue,fontSize: 20,),
                                        errorBorder: OutlineInputBorder()),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(onPressed: (){
                          setState(() {
                            apicallss();
                            showDialog(context: context, builder: (BuildContext context) => AlertDialog(
                                insetPadding: EdgeInsets.all(20),
                                actions: <Widget>[
                                  Column(
                                    children: [
                                      Text(Branches[0]['branchName']),
                                      Container(
                                        width: double.maxFinite,
                                        height: 60,
                                        color: Colors.blue[200],child: Center(child: Text('Do you have Promocode?',style: TextStyle(fontSize: 20),)),),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(50,30,50,10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Colors.black)
                                          ),
                                          child: Center(
                                            child: Column(
                                              children: [
                                                TextField(
                                                  onChanged: (value){
                                                    setState(() {
                                                      name=value;
                                                    });
                                                  },
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                      hintText: 'Enter Promocode',
                                                      hintStyle: TextStyle(color: Colors.blue,fontSize: 20,),
                                                      errorBorder: OutlineInputBorder()),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(onPressed: (){
                                        setState(() {
                                         // enter=name;
                                          Navigator.pop(context);
                                        });

                                      }, child: Text('CANCEL'),),

                                      Row(
                                        children: [
                                          Flexible(
                                            flex:5,
                                            child: Container(
                                              height: 45,
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topRight,
                                                    end: Alignment.bottomLeft,
                                                    colors: [
                                                      Color(0xFFA3EFEF),
                                                      Color(0xFF0EB4B4),
                                                    ],
                                                  ),
                                                  borderRadius: BorderRadius.circular(20)),
                                              child: Center(child: Text('cancel',style: TextStyle(color: Colors.white,fontSize: 20,),)),
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Flexible(
                                            flex: 5,
                                            child: Container(
                                              height: 45,
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topRight,
                                                    end: Alignment.bottomLeft,
                                                    colors: [
                                                      Color(0xFFA3EFEF),
                                                      Color(0xFF0EB4B4),
                                                    ],
                                                  ),
                                                  borderRadius: BorderRadius.circular(20)),
                                              child: Center(child: Text('Apply',style: TextStyle(color: Colors.white,fontSize: 20,),)),
                                            ),
                                          ),
                                        ],
                                      ),


                                    ],
                                  ),

                                ]
                            ));
                            
                            
                          });

                        }, child: Text('CANCEL'),),

                        Row(
                          children: [
                            Flexible(
                              flex:5,
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        Color(0xFFA3EFEF),
                                        Color(0xFF0EB4B4),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(child: Text('cancel',style: TextStyle(color: Colors.white,fontSize: 20,),)),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Flexible(
                              flex: 5,
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        Color(0xFFA3EFEF),
                                        Color(0xFF0EB4B4),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(child: Text('Apply',style: TextStyle(color: Colors.white,fontSize: 20,),)),
                              ),
                            ),
                          ],
                        ),


                      ],
                    ),

                  ]
              ));
            }, child: Text('hello')),
            Text(name)
          ],
        ),
      ),
    );
  }
}
