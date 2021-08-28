import 'package:flutter/material.dart';

// class Test extends StatefulWidget {
//   const Test({Key? key}) : super(key: key);
//
//   @override
//   _TestState createState() => _TestState(t: '');
// }
//
// class _TestState extends State<Test> {
//   String t="";
//
//   _TestState({required this.t});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(
//         child: Text(t),
//       ),
//     );
//   }
// }
class Test extends StatelessWidget {
  final String t;
  const Test( this.t);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(t),
      ),
    );
  }
}

