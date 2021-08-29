import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:project_covid_vn/cubit/vn_vaccine/vn_vaccine_cubit.dart';

class VaccineInfor extends StatelessWidget {
  const VaccineInfor({
    Key? key,
    required this.size,
  }) : super(key: key);
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height*0.18,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                offset: Offset(0,5)
            )
          ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: size.width*0.23-5,
            height: size.height*0.18,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          children: [
                            TextSpan(text: "Total\n", style: TextStyle(color: Colors.black, fontSize: 15, fontFamily: "Ubuntu")),
                            TextSpan(text: "Vaccinations\n", style: TextStyle(color: Colors.black,fontSize: 13, fontFamily: "Ubuntu")),

                          ]
                      )
                  ),
                ),
                BlocBuilder<VnVaccineCubit, VnVaccineState>(
                builder: (context, state) {
                  if(state is VnVaccineInitial){
                    return SizedBox(
                      width: 30,
                        height: 30,
                        child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black)));
                  }
                  else if(state is VnVaccineLoaded){
                    var formatter = NumberFormat('#,###,000');
                    var count=formatter.format(state.data.totalVaccinations);
                    return Text(count, style: TextStyle(fontFamily: "FlutterIcons", fontSize: 16, color: Colors.orange),);
                  }
                  return SizedBox(
                      width: 30,
                      height: 30,
                      child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black)));
                },
              )
              ],
            ),
          ),
          Container(
            width: size.width*0.23-5,
            height: size.height*0.18,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          children: [
                            TextSpan(text: "People\n", style: TextStyle(color: Colors.black, fontSize: 15, fontFamily: "Ubuntu",)),
                            TextSpan(text: "Vaccinated\n", style: TextStyle(color: Colors.black,fontSize: 13, fontFamily: "Ubuntu")),

                          ]
                      )
                  ),
                ),
                BlocBuilder<VnVaccineCubit, VnVaccineState>(
                  builder: (context, state) {
                    if(state is VnVaccineInitial){
                      return SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black))
                      );
                    }
                    else if(state is VnVaccineLoaded){
                      var formatter = NumberFormat('#,###,000');
                      var count=formatter.format(state.data.peopleVaccinated);
                      return Text(count, style: TextStyle(fontFamily: "FlutterIcons", fontSize: 16, color: Color(0xFF002163),));
                    }
                    return SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black))
                    );
                  },
                )
              ],
            ),
          ),
          Container(
            width: size.width*0.23-5,
            height: size.height*0.18,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          children: [
                            TextSpan(text: "People Full\n", style: TextStyle(color: Colors.black, fontSize: 15, fontFamily: "Ubuntu")),
                            TextSpan(text: "Vaccinated\n", style: TextStyle(color: Colors.black,fontSize: 13, fontFamily: "Ubuntu")),

                          ]
                      )
                  ),
                ),
                BlocBuilder<VnVaccineCubit, VnVaccineState>(
                  builder: (context, state) {
                    if(state is VnVaccineInitial){
                      return SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black))
                      );
                    }
                    else if(state is VnVaccineLoaded){
                      var formatter = NumberFormat('#,###,000');
                      var count=formatter.format(state.data.peopleFullyVaccinated);
                      return Text(count, style: TextStyle(fontFamily: "FlutterIcons", fontSize: 16, color: Colors.green),);
                    }
                    return SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black))
                    );
                  },
                )
              ],
            ),
          ),
          Container(
            width: size.width*0.23-5,
            height: size.height*0.18,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          children: [
                            TextSpan(text: "Daily\n", style: TextStyle(color: Colors.black, fontSize: 15, fontFamily: "Ubuntu")),
                            TextSpan(text: "Vaccinations\n", style: TextStyle(color: Colors.black,fontSize: 13, fontFamily: "Ubuntu")),
                          ]
                      )
                  ),
                ),
                BlocBuilder<VnVaccineCubit, VnVaccineState>(
                  builder: (context, state) {
                    if(state is VnVaccineInitial){
                      return SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black))
                      );
                    }
                    else if(state is VnVaccineLoaded){
                      var formatter = NumberFormat('#,###,000');
                      var count=formatter.format(state.data.dailyVaccinations);
                      return Text(count, style: TextStyle(fontFamily: "FlutterIcons", fontSize: 16, color: Colors.red),);
                    }
                    return SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black))
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
