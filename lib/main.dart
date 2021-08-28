import 'package:flutter/material.dart';
import 'package:project_covid_vn/router.dart';
import 'package:project_covid_vn/screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}
//api key : AIzaSyB_Ctc1bsz5Fi1wOeYgZ182xGdLe1BuKpU
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        
      ),
      initialRoute: RouterGenerator.splash,
      onGenerateRoute: RouterGenerator.generateRoute,
      home: SplashScreen(),
    );
  }
}
