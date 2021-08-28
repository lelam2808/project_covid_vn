import 'package:flutter/material.dart';
import 'package:project_covid_vn/HTTPSERVICE/vn_covid_distribution_service.dart';
import 'package:project_covid_vn/HTTPSERVICE/vn_sevices.dart';
import 'package:project_covid_vn/HTTPSERVICE/vn_vaccine.dart';
import 'package:project_covid_vn/HTTPSERVICE/vn_vaccine_distribution_service.dart';
import 'package:project_covid_vn/HTTPSERVICE/world_sevices.dart';
import 'package:project_covid_vn/cubit/vn_vaccine_distribution/vn_vaccine_distribution_cubit.dart';
import 'package:project_covid_vn/cubit/worldCase/world_case_cubit.dart';
import 'package:project_covid_vn/models/world_case.dart';

import '../router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {


    var size=MediaQuery.of(context).size;  // @override
    // void initState() {
    //   Future.delayed(Duration(seconds: 10), (){
    //     Navigator.of(context).pushNamed(
    //       RouterGenerator.homeScreen
    //     );
    //   });
    //   super.initState();
    // }
    return SafeArea(
      child: Scaffold(
      
        body: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF473F97),
                    Color(0xFF473F97).withOpacity(0.5)
                  ]
              )
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: size.height*0.02),
                child: Container(
                  width: size.width*0.4,
                  height: size.height*0.1,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/logo.png"),
                          fit: BoxFit.fill
                      )
                  ),
                ),
              ),
              SizedBox(height: size.height*0.02),
              Container(
                width: size.width,
                height: size.height*0.5,
                child: Stack(
                  children: [
                    Positioned(
                      left:size.width*0.1,
                      bottom: 0,
                      child: Container(
                        width: size.width*0.7,
                        height: size.height*0.3,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/virus.png"),
                                fit: BoxFit.fill
                            )
                        ),
                      ),
                    ),
                    Positioned(
                      right: size.width*0.07,
                      top: 0,
                      child: Container(
                        width: size.width*0.35,
                        height: size.height*0.35,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/person.png"),
                                fit: BoxFit.fill
                            )
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: size.height*.07,),
              Expanded(
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20)
                      ),
                      color: Colors.white
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top:10),
                        child: Text("BE AWARE", style: TextStyle(fontSize: 24,fontFamily: 'Ubuntu'),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text("STAY HEALTHY", style: TextStyle(fontSize: 24, fontFamily: 'Ubuntu'),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 14),
                        child: Text("Welcome to Covid-19 informations app", style: TextStyle(fontSize: 15, fontFamily: 'Ubuntu'),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: size.width*0.55, top: 20),
                        child: Row(
                          children: [
                            Text("GET STARTED", style: TextStyle( fontWeight: FontWeight.bold,  fontFamily: 'FlutterIcons'),),
                            SizedBox(width: 20,),
                            GestureDetector(
                              onTap: (){
                                Navigator.of(context).pushNamed(RouterGenerator.homeScreen);
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Color(0xFF473F97),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Icon(Icons.arrow_forward, color: Colors.white,),
                              ),
                            )

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );;
  }
}

