import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_covid_vn/call_sendSms/service_call_sms.dart';

class BelowAppBar extends StatelessWidget {
  const BelowAppBar({
    Key? key,
    required this.size,
  }) : super(key: key);
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(
          color:Color(0xFF473F97),
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20)
          )
      ),
      child: Row(
        children: [
          Container(
            width: size.width*0.45,
            height: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/virus.png"),
                )
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding(
              //   padding: const EdgeInsets.only(left: 12.0),
              //   child: Text("COVID-19", style: TextStyle(fontSize: 22, color: Colors.white, fontFamily: "Ubuntu"),),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0,bottom: 5),
                child: Text("Are you feeling Sick ?",style: TextStyle(fontSize: 16, color: Colors.white, fontFamily: "Ubuntu")),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Container(
                  width: size.width*0.5,
                    height: 50,
                    child: Text("If you feel sick with any COVID-19 symptoms please call or text us immediately!",overflow: TextOverflow.clip,style: TextStyle(fontSize: 11, color: Colors.white, fontFamily: "Ubuntu"))),
              ),
              // Text("symptoms please call or text us immediately!", overflow: TextOverflow.clip,style: TextStyle(fontSize: 9, color: Colors.white, fontFamily: "Ubuntu")),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: ()=>SmsAndCall.callNumber(),
                      child: Container(
                        width: size.width*0.225,
                        height: 35,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.call,color: Colors.white, size: 20),
                            SizedBox(width: 5,),
                            Text('Call',style: TextStyle(fontSize: 15, color: Colors.white))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    GestureDetector(
                      onTap: ()=>SmsAndCall.sendSMSToBYT("", ["115"]),
                      child: Container(
                        width: size.width*0.225,
                        height: 35,
                        decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.email, color: Colors.white, size: 20,),
                            SizedBox(width: 5,),
                            Text('SMS', style: TextStyle(fontSize: 15, color: Colors.white),)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
