import 'package:flutter/material.dart';

class DetailVaccine extends StatelessWidget {
  const DetailVaccine({
    Key? key,
    required this.plan,
    required this.vaccine,
    required this.oneDose,
    required this.fullDose,
    required this.rate,
    required this.tenTinh
  }) : super(key: key);

  final double rate;
  final dynamic tenTinh;
  final String plan;
  final String vaccine, oneDose, fullDose;

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("$tenTinh", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, fontFamily: "Ubuntu"),),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: size.width*0.2,
                      child: Column(
                        children: [
                          Text("Plan", style: TextStyle(fontFamily: "Ubuntu", fontSize: 15),),
                          SizedBox(height: 5,),
                          Text("$plan",style: TextStyle(fontFamily: "Ubuntu", fontSize: 14)),

                        ],
                      ),
                    ),
                    Container(
                      width: size.width*0.2,
                      child: Column(
                        children: [
                          Text("Vaccine", style: TextStyle(fontFamily: "Ubuntu", fontSize: 15)),
                          SizedBox(height: 5,),
                          Text("$vaccine", style: TextStyle(fontFamily: "Ubuntu", fontSize: 14)),

                        ],
                      ),
                    ),
                    Container(
                      width: size.width*0.2,
                      child: Column(
                        children: [
                          Text("OneDose", style: TextStyle(fontFamily: "Ubuntu", fontSize: 15)),
                          SizedBox(height: 5,),
                          Text("$oneDose", style: TextStyle(fontFamily: "Ubuntu", fontSize: 14)),

                        ],
                      ),
                    ),
                    Container(
                      width: size.width*0.2,
                      child: Column(
                        children: [
                          Text("FullDose", style: TextStyle(fontFamily: "Ubuntu", fontSize: 15)),
                          SizedBox(height: 5,),
                          Text("$fullDose", style: TextStyle(fontFamily: "Ubuntu", fontSize: 14)),
                        ],
                      ),
                    ),
                    Container(
                      width: size.width*0.2,
                      child: Column(
                        children: [
                          Text("Rate", style: TextStyle(fontFamily: "Ubuntu", fontSize: 15)),
                          SizedBox(height: 5,),
                          Text("$rate", style: TextStyle(fontFamily: "Ubuntu", fontSize: 14)),

                        ],
                      ),
                    )
                  ],
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}