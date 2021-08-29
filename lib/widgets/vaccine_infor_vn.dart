
import 'package:auto_size_text/auto_size_text.dart';
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
      height: size.height*0.16,
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
            height: size.height*0.18,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width*0.25,
                  height: 50,
                  child: AutoSizeText.rich(
                    TextSpan(text: "Total\n Vaccinations"),
                    style: TextStyle(fontSize: 15,color: Colors.black, fontFamily: "Ubuntu"),
                    minFontSize: 5,
                    maxLines: 3,
                    textAlign: TextAlign.center,
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
                    return AutoSizeText(
                      '$count',
                      style: TextStyle(fontFamily: "FlutterIcons", fontSize: 15, color: Colors.orange),
                      minFontSize: 5,
                      maxLines: 1,
                    );
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
            height: size.height*0.18,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width*0.25,
                  height: 50,
                  child: AutoSizeText.rich(
                    TextSpan(text: "People\n Vaccinated"),
                    style: TextStyle(fontSize: 15,color: Colors.black, fontFamily: "Ubuntu"),
                    minFontSize: 5,
                    maxLines: 3,
                    textAlign: TextAlign.center,
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
                      return AutoSizeText(
                        '$count',
                        style: TextStyle(fontFamily: "FlutterIcons", fontSize: 15, color: Color(0xFF002163)),
                        minFontSize: 5,
                        maxLines: 1,
                      );
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
            height: size.height*0.18,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width*0.25,
                  height: 50,
                  child: AutoSizeText.rich(
                    TextSpan(text: "People Full\n Vaccinated"),
                    style: TextStyle(fontSize: 15,color: Colors.black, fontFamily: "Ubuntu"),
                    minFontSize: 5,
                    maxLines: 3,
                    textAlign: TextAlign.center,
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
                      return AutoSizeText(
                        '$count',
                        style: TextStyle(fontFamily: "FlutterIcons", fontSize: 15, color: Colors.green),
                        minFontSize: 5,
                        maxLines: 1,
                      );
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
            height: size.height*0.18,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width*0.25,
                  height: 50,
                  child: AutoSizeText.rich(
                    TextSpan(text: "Daily\n Vaccination"),
                    style: TextStyle(fontSize: 15,color: Colors.black, fontFamily: "Ubuntu"),
                    minFontSize: 5,
                    maxLines: 3,
                    textAlign: TextAlign.center,
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
                      return AutoSizeText(
                        '$count',
                        style: TextStyle(fontFamily: "FlutterIcons", fontSize: 15, color: Colors.red),
                        minFontSize: 5,
                        maxLines: 1,
                      );
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
