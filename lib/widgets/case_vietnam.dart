import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:project_covid_vn/cubit/vnCases/vn_case_cubit.dart';

class CaseVietNam extends StatefulWidget {
  const CaseVietNam({Key? key}) : super(key: key);

  @override
  _CaseVietNamState createState() => _CaseVietNamState();
}

class _CaseVietNamState extends State<CaseVietNam> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<VnCaseCubit>().getCaseFromVn();
  }
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: size.width*0.2/3),
        child: Text("In VietNam", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Ubuntu', fontSize: 16),),
        ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        Padding(
        padding:  EdgeInsets.symmetric(horizontal: size.width*0.2/3, vertical: 10),
          child: Container(
              width: size.width*0.4,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Total Cases", style: TextStyle(fontFamily: "Ubuntu", fontSize: 20, color: Colors.white),),
                  SizedBox(height: 10,),
                  BlocBuilder<VnCaseCubit, VnCaseState>(
                    builder: (context, state) {
                      // print(state);
                      if(state is VnCaseInitial){
                        return CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white));
                      }
                      else if(state is VnCaseLoading){
                        return CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white));
                      }
                      else if(state is VnCaseLoadedFailed){
                        return Text(state.message.toString(), style: TextStyle(fontSize: 20, color: Colors.white),);
                      }
                      else if(state is VnCaseLoaded) {
                        var add = state.vnCase.todayCases;
                        var formatter = NumberFormat('#,###,000');
                        var count = formatter.format(state.vnCase.cases);
                        if (add.toString() == "null") {
                          print(add);
                          return RichText(
                            textAlign: TextAlign.center,
                              text: TextSpan(
                                  children: [
                                    TextSpan(text: count.toString(),
                                        style: TextStyle(
                                          fontSize: 17, color: Colors.white,)),
                                    TextSpan(text: "\n(Today Does Not Count)",
                                        style: TextStyle(
                                          fontSize: 10, color: Colors.white,))
                                  ]
                              )
                          );
                          // return Text(count+"\n(Loading)", style: TextStyle(fontSize: 16, color: Colors.white, ));
                        }
                        else {
                          return RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  children: [
                                    TextSpan(text: count.toString(),
                                        style: TextStyle(
                                          fontSize: 17, color: Colors.white,)),
                                    TextSpan(text: "\n(+$add)",
                                        style: TextStyle(
                                          fontSize: 15, color: Colors.red))
                                  ]
                              )
                          );
                        }
                      }
                      return Text("");
                    },
                  ),
                ],
              )
          ),
      ),
          Container(
              width: size.width*0.4,
              height: 100,
              decoration: BoxDecoration(
                  color: Color(0xFFff294d).withOpacity(0.9),
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Total Deaths", style: TextStyle(fontFamily: "Ubuntu", fontSize: 20, color: Colors.white),),
                  SizedBox(height: 10,),
                  BlocBuilder<VnCaseCubit, VnCaseState>(
                    builder: (context, state) {
                      if(state is VnCaseInitial){
                        return CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white));
                      }
                      else if(state is VnCaseLoading){
                        return CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white));
                      }
                      else if(state is VnCaseLoadedFailed){
                        return Text(state.message.toString(), style: TextStyle(fontSize: 20, color: Colors.white),);
                      }
                      else if(state is VnCaseLoaded){
                        var add = state.vnCase.todayDeaths;
                        var formatter = NumberFormat('#,###,000');
                        var count = formatter.format(state.vnCase.deaths);
                        if (add.toString() == "null") {
                          print(add);
                          return RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  children: [
                                    TextSpan(text: count.toString(),
                                        style: TextStyle(
                                          fontSize: 17, color: Colors.white,)),
                                    TextSpan(text: "\n(Today Does Not Count)",
                                        style: TextStyle(
                                          fontSize: 10, color: Colors.white,))
                                  ]
                              )
                          );
                          // return Text(count+"\n(Loading)", style: TextStyle(fontSize: 16, color: Colors.white, ));
                        }
                        else {
                          return RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  children: [
                                    TextSpan(text: count.toString(),
                                        style: TextStyle(
                                          fontSize: 17, color: Colors.white,)),
                                    TextSpan(text: "\n(+$add)",
                                        style: TextStyle(
                                          fontSize: 15, color: Colors.yellow,))
                                  ]
                              )
                          );
                        }
                      }
                      return Text("");
                    },
                  ),
                ],
              )
          ),
      ]
      ),
      Padding(
        padding:EdgeInsets.symmetric(horizontal: size.width*0.25/4),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: size.width*0.27,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Active", style: TextStyle(fontFamily: "Ubuntu", fontSize: 18, color: Colors.white),),
                  SizedBox(height: 10,),
                  BlocBuilder<VnCaseCubit, VnCaseState>(
                    builder: (context, state) {
                      if(state is VnCaseInitial){
                        return CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white));
                      }
                      else if(state is VnCaseLoading){
                        return CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white));
                      }
                      else if(state is VnCaseLoadedFailed){
                        return Text(state.message.toString(), style: TextStyle(fontSize: 20, color: Colors.white),);
                      }
                      else if(state is VnCaseLoaded){

                        var formatter = NumberFormat('#,###,000');
                        var count=formatter.format(state.vnCase.active);
                        return Text(count, style: TextStyle(fontSize: 15, color: Colors.white));
                      }
                      return Text("");
                    },
                  ),
                ],
              )
          ),
          Container(
              width: size.width*0.27,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Recovered", style: TextStyle(fontFamily: "Ubuntu", fontSize: 18, color: Colors.white),),
                  SizedBox(height: 10,),
                  BlocBuilder<VnCaseCubit, VnCaseState>(
                    builder: (context, state) {
                      if(state is VnCaseInitial){
                        return CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white));
                      }
                      else if(state is VnCaseLoading){
                        return CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white));
                      }
                      else if(state is VnCaseLoadedFailed){
                        return Text(state.message.toString(), style: TextStyle(fontSize: 20, color: Colors.white),);
                      }
                      else if(state is VnCaseLoaded){
                        var add = state.vnCase.todayRecovered;
                        var formatter = NumberFormat('#,###,000');
                        var count = formatter.format(state.vnCase.recovered);
                        if (add.toString() == "null") {
                          return RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  children: [
                                    TextSpan(text: count.toString(),
                                        style: TextStyle(
                                          fontSize: 17, color: Colors.white,)),
                                    TextSpan(text: "\n(Today Does Not Count)",
                                        style: TextStyle(
                                          fontSize: 10, color: Colors.white,))
                                  ]
                              )
                          );
                          // return Text(count+"\n(Loading)", style: TextStyle(fontSize: 16, color: Colors.white, ));
                        }
                        else {
                          return RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  children: [
                                    TextSpan(text: count.toString(),
                                        style: TextStyle(
                                          fontSize: 17, color: Colors.white,)),
                                    TextSpan(text: "\n(+$add)",
                                        style: TextStyle(
                                          fontSize: 15, color: Colors.green,))
                                  ]
                              )
                          );
                        }
                      }
                      return Text("");
                    },
                  ),
                ],
              )
          ),
          Container(
              width: size.width*0.27,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Critical", style: TextStyle(fontFamily: "Ubuntu", fontSize: 18, color: Colors.white),),
                  SizedBox(height: 10,),
                  BlocBuilder<VnCaseCubit, VnCaseState>(
                    builder: (context, state) {
                      if(state is VnCaseInitial){
                        return CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white));
                      }
                      else if(state is VnCaseLoading){
                        return CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white));
                      }
                      else if(state is VnCaseLoadedFailed){
                        return Text(state.message.toString(), style: TextStyle(fontSize: 20, color: Colors.white),);
                      }
                      else if(state is VnCaseLoaded){
                        // print(state.vnCase.critical);
                        // var count;
                        // if(state.vnCase.critical==null) {
                        //   print(1);
                        //   var formatter = NumberFormat('#,###,000');
                        //   count = formatter.format(state.vnCase.critical);
                        // }
                        // else {
                        //   var count="Null";
                        // }
                        return Text(state.vnCase.critical.toString().toUpperCase(), style: TextStyle(fontSize: 15, color: Colors.white));
                      }
                      return Text("");
                    },
                  ),
                ],
              )
          ),
        ],
      ),
      ),
    ]
  );
  }
}


