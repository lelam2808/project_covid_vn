import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_covid_vn/screen/home_screen.dart';
import 'package:project_covid_vn/screen/splash_screen.dart';

class RouterGenerator{
  static const String splash="/splash";
  static const String homeScreen="/home";
  // RouterGenerator._();
  static Route<dynamic> generateRoute(RouteSettings settings) {
      switch(settings.name){
        case splash:
          return MaterialPageRoute(builder: (_)=>SplashScreen());
        case homeScreen:
          return MaterialPageRoute(builder: (_)=>HomeScreen());
        default:
          throw FormatException("Route not found");
      }
  }

}