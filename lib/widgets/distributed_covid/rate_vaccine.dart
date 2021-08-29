
import 'package:flutter/material.dart';

class RateVaccine extends StatelessWidget {
  const RateVaccine({
    Key? key, required this.color, required this.numberCase,
  }) : super(key: key);
  final Color color;
  final String numberCase;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            color: color,
          ),
          SizedBox(width: 5,),
          Text("$numberCase", style: TextStyle(fontSize: 10),)
        ],
      ),
    );
  }
}