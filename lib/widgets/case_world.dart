import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:project_covid_vn/cubit/worldCase/world_case_cubit.dart';

class CaseWorld extends StatefulWidget {
  const CaseWorld({Key? key}) : super(key: key);

  @override
  _CaseWorldState createState() => _CaseWorldState();
}

class _CaseWorldState extends State<CaseWorld> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<WorldCaseCubit>().getWorldCaseFromService();
  }
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: size.width*0.2/3),
            child: Text("In The World",style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Ubuntu', fontSize: 16),),
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
                        color: Colors.orange.withOpacity(.7),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Total Cases", style: TextStyle(fontFamily: "Ubuntu", fontSize: 20, color: Colors.white),),
                        SizedBox(height: 10,),
                        BlocBuilder<WorldCaseCubit, WorldCaseState>(
                          builder: (context, state) {
                            // print(state);
                            if(state is WorldCaseInitial){
                              return CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white));
                            }
                            else if(state is WorldCaseLoading){
                              return CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white));
                            }
                            else if(state is WorldCaseLoadedFailed){
                              return Text(state.message.toString(), style: TextStyle(fontSize: 20, color: Colors.white),);
                            }
                            else if(state is WorldCaseLoaded){
                              var formatter = NumberFormat('#,###,000');
                              var count=formatter.format(state.worldCase.cases);
                              return Text(count, style: TextStyle(fontSize: 16, color: Colors.white));
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
                        color: Color(0xFFff294d).withOpacity(.8),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Total Deaths", style: TextStyle(fontFamily: "Ubuntu", fontSize: 20, color: Colors.white),),
                        SizedBox(height: 10,),
                        BlocBuilder<WorldCaseCubit, WorldCaseState>(
                          builder: (context, state) {
                            // print(state);
                            if(state is WorldCaseInitial){
                              return CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white));
                            }
                            else if(state is WorldCaseLoading){
                              return CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white));
                            }
                            else if(state is WorldCaseLoadedFailed){
                              return Text(state.message.toString(), style: TextStyle(fontSize: 20, color: Colors.white),);
                            }
                            else if(state is WorldCaseLoaded){
                              var formatter = NumberFormat('#,###,000');
                              var count=formatter.format(state.worldCase.deaths);
                              return Text(count, style: TextStyle(fontSize: 16, color: Colors.white));
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
                        color: Colors.green.withOpacity(.7),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Active", style: TextStyle(fontFamily: "Ubuntu", fontSize: 18, color: Colors.white),),
                        SizedBox(height: 10,),
                        BlocBuilder<WorldCaseCubit, WorldCaseState>(
                          builder: (context, state) {
                            // print(state);
                            if(state is WorldCaseInitial){
                              return CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white));
                            }
                            else if(state is WorldCaseLoading){
                              return CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white));
                            }
                            else if(state is WorldCaseLoadedFailed){
                              return Text(state.message.toString(), style: TextStyle(fontSize: 20, color: Colors.white),);
                            }
                            else if(state is WorldCaseLoaded){
                              var formatter = NumberFormat('#,###,000');
                              var count=formatter.format(state.worldCase.active);
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
                        color: Colors.lightBlueAccent.withOpacity(.7),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Recovered", style: TextStyle(fontFamily: "Ubuntu", fontSize: 18, color: Colors.white),),
                        SizedBox(height: 10,),
                        BlocBuilder<WorldCaseCubit, WorldCaseState>(
                          builder: (context, state) {
                            // print(state);
                            if(state is WorldCaseInitial){
                              return CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white));
                            }
                            else if(state is WorldCaseLoading){
                              return CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white));
                            }
                            else if(state is WorldCaseLoadedFailed){
                              return Text(state.message.toString(), style: TextStyle(fontSize: 20, color: Colors.white),);
                            }
                            else if(state is WorldCaseLoaded){
                              var formatter = NumberFormat('#,###,000');
                              var count=formatter.format(state.worldCase.recovered);
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
                        color: Colors.purple.withOpacity(.7),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Critical", style: TextStyle(fontFamily: "Ubuntu", fontSize: 18, color: Colors.white),),
                        SizedBox(height: 10,),
                        BlocBuilder<WorldCaseCubit, WorldCaseState>(
                          builder: (context, state) {
                            // print(state);
                            if(state is WorldCaseInitial){
                              return CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white));
                            }
                            else if(state is WorldCaseLoading){
                              return CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white));
                            }
                            else if(state is WorldCaseLoadedFailed){
                              return Text(state.message.toString(), style: TextStyle(fontSize: 20, color: Colors.white),);
                            }
                            else if(state is WorldCaseLoaded){
                              var formatter = NumberFormat('#,###,000');
                              var count=formatter.format(state.worldCase.critical);
                              return Text(count, style: TextStyle(fontSize: 15, color: Colors.white));
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

