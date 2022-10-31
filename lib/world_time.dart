
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class world_time{
  late String location;
  late String Url;
  late String api;
  late String clock;
  late String now;
 late String hours;

  world_time(this.location, this.Url,this.api);

  Future<void> getapi()async {
    Response response = await get(
        Uri.parse('https://worldtimeapi.org/api/timezone/$api'));
    Map body = jsonDecode(response.body);
     String time = body["datetime"];
     String offset=body["utc_offset"];
   //  DateTime dateTime=DateTime.parse(time);
  //  dateTime=dateTime.add(Duration(hours: int.parse(offset)));

  //   clock=DateFormat.jm().format(dateTime);
 hours=time.substring(11,13) ;
clock=time.substring(11,16);
    print(clock);
    print(hours);

  }
}