import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_covid_vn/router.dart';
import 'package:project_covid_vn/screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) =>
        Navigator.pushNamed(context, RouterGenerator.homeScreen));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;  // @override
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: size.height*0.1),
                child: Container(
                  width: size.width,
                  height: size.height*0.6,
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    image: DecorationImage(
                      image: AssetImage("assets/images/splash.png"),
                      fit: BoxFit.contain
                    )
                  ),

                ),
              ),
              SizedBox(height: size.height*0.05,),
              CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF03648e))),
              Expanded(
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                      // color: Colors.purple,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20)
                      ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Center(child: Text("Welcome to Covid-19 informations app", style: TextStyle(fontSize: 15, fontFamily: 'Ubuntu', color: Color(0xFF03648e)),)),
                      ),
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

