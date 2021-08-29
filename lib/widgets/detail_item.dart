import 'package:flutter/material.dart';
class DetailItem extends StatelessWidget {
  final String tp, tcn, hn, tv;
  const DetailItem({
    Key? key,
    required this.tp,
    required this.tcn,
    required this.hn,
    required this.tv,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("$tp",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, fontFamily: "Ubuntu")),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text("Total Cases",style: TextStyle(fontFamily: "Ubuntu", fontSize: 14)),
                    SizedBox(height: 5,),
                    Text("$tcn",style: TextStyle(fontFamily: "Ubuntu", fontSize: 14))
                  ],
                ),
                SizedBox(width: 30,),
                Column(
                  children: [
                    Text("Today Cases",style: TextStyle(fontFamily: "Ubuntu", fontSize: 14)),
                    SizedBox(height: 5,),
                    Text("$hn",style: TextStyle(fontFamily: "Ubuntu", fontSize: 14))
                  ],
                ),
                SizedBox(width: 30,),
                Column(
                  children: [
                    Text("Total Deaths",style: TextStyle(fontFamily: "Ubuntu", fontSize: 14)),
                    SizedBox(height: 5,),
                    Text("$tv",style: TextStyle(fontFamily: "Ubuntu", fontSize: 14))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
