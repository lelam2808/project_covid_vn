import 'package:flutter/material.dart';

class DetailVaccine extends StatelessWidget {
  const DetailVaccine({
    Key? key,
    required this.oneDose,
    required this.fullDose,
    required this.rate,
    required this.tenTinh,
    required this.plan
  }) : super(key: key);

  final double rate;
  final String tenTinh;
  final String oneDose, fullDose, plan;

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          // borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: Offset(-10,0)
            )
          ]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Text("$tenTinh", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, fontFamily: "Ubuntu"),),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Text("Plan", style: TextStyle(fontFamily: "Ubuntu", fontSize: 15)),
                        SizedBox(height: 5,),
                        Text("$plan", style: TextStyle(fontFamily: "Ubuntu", fontSize: 14)),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text("OneDose", style: TextStyle(fontFamily: "Ubuntu", fontSize: 15)),
                        SizedBox(height: 5,),
                        Text("$oneDose", style: TextStyle(fontFamily: "Ubuntu", fontSize: 14)),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text("FullDose", style: TextStyle(fontFamily: "Ubuntu", fontSize: 15)),
                        SizedBox(height: 5,),
                        Text("$fullDose", style: TextStyle(fontFamily: "Ubuntu", fontSize: 14)),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text("Rate", style: TextStyle(fontFamily: "Ubuntu", fontSize: 15)),
                        SizedBox(height: 5,),
                        Text("$rate", style: TextStyle(fontFamily: "Ubuntu", fontSize: 14)),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}