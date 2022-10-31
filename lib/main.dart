

import 'package:flutter/material.dart';
import 'home.dart';
import 'choose_location.dart';
import 'loadng.dart';



void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/':(context)=>Choose_location(),
      '/home':(context)=>Home(),
      '/location':(context)=>Loading(),

    },
  ));
}




