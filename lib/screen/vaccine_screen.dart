import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:project_covid_vn/HTTPSERVICE/vn_vaccine_distribution_service.dart';
import 'package:project_covid_vn/cubit/vn_vaccine/vn_vaccine_cubit.dart';
import 'package:project_covid_vn/cubit/vn_vaccine_distribution/vn_vaccine_distribution_cubit.dart';
import 'package:project_covid_vn/models/vn_vaccine_distribution.dart';
import 'package:project_covid_vn/widgets/test.dart';
import 'package:project_covid_vn/widgets/vaccine_infor_vn.dart';
import 'package:project_covid_vn/widgets/vaccine_infor_vn_details.dart';

class VaccineScreen extends StatefulWidget {
  const VaccineScreen({Key? key}) : super(key: key);

  @override
  _VaccineScreenState createState() => _VaccineScreenState();
}

class _VaccineScreenState extends State<VaccineScreen>  with AutomaticKeepAliveClientMixin<VaccineScreen>{
  @override
  void initState() {
    // TODO: implement initState
    context.read<VnVaccineCubit>().getVaccineVn();
    context.read<VnVaccineDistributionCubit>().getVaccineDitributionVn();
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    var size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF473F97),
        centerTitle: true,
        title: BlocBuilder<VnVaccineCubit, VnVaccineState>(
        builder: (context, state) {
          if (state is VnVaccineLoaded) {
            return RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  children: [
                    TextSpan(text: "Vaccine In VietNam\n",
                        style: TextStyle(
                            fontFamily: "FlutterIcons", fontSize: 16)),
                    TextSpan(text: "Last Update "+ state.data.date.toString().substring(0,10),
                        style: TextStyle(
                            fontFamily: "FlutterIcons", fontSize: 12))
                  ]
              ),
            );
          }
          return RichText(

            textAlign: TextAlign.center,
            text: TextSpan(
                children: [
                  TextSpan(text: "Vaccine In VietNam\n",
                      style: TextStyle(
                          fontFamily: "FlutterIcons",fontSize: 16)),
                ]
            ),
          );
          },
      ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children:[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
            VaccineInfor(size: size,),
             Padding(
                  padding: const EdgeInsets.only(left: 10,top: 15,bottom: 15,),
                  child: Center(child: Text("Vaccine Details ", style: TextStyle(fontSize: 18, fontFamily: 'Ubuntu'),)),
                ),
              BlocBuilder<VnVaccineDistributionCubit, VnVaccineDistributionState>(
                builder: (context, state) {
                  if(state is VnVaccineDistributionLoaded){
                    var formatter = NumberFormat('#,###,000');
                    // var count=formatter.format(state.data.totalVaccinations);
                    return Column(
                      children:
                        state.vaccineDistribution.dataDistribution.map((key, value) => MapEntry(key,
                        DetailVaccine(
                          tenTinh: state.vaccineDistribution.dataDistribution[key]!.name,
                          rate: state.vaccineDistribution.dataDistribution[key]!.distributedRate.toDouble(),
                          plan: formatter.format(state.vaccineDistribution.dataDistribution[key]!.planned),
                          fullDose: formatter.format(state.vaccineDistribution.dataVacDose[key]!.fulldose),
                          oneDose:  formatter.format(state.vaccineDistribution.dataVacDose[key]!.onedose),
                          vaccine:  formatter.format(state.vaccineDistribution.dataVacDose[key]!.vaccines),
                        )
                        )).values.toList()

                    );
                  }
                  return Padding(
                    padding:  EdgeInsets.symmetric(vertical: size.height*0.2),
                    child: Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black))),
                  );
                },
              ),
              // DetailVaccine(size: size, stt: 1,tenTinh: "Hue", fullDose: 11, oneDose: 11, plan: 100, rate: 1, vaccine: 1000,),
              // DetailVaccine(size: size, stt: 1,tenTinh: "Hue", fullDose: 11, oneDose: 11, plan: 100, rate: 1, vaccine: 1000,),
              // DetailVaccine(size: size, stt: 1,tenTinh: "Hue", fullDose: 11, oneDose: 11, plan: 100, rate: 1, vaccine: 1000,),
              // DetailVaccine(size: size, stt: 1,tenTinh: "Hue", fullDose: 11, oneDose: 11, plan: 100, rate: 1, vaccine: 1000,),
              // DetailVaccine(size: size, stt: 1,tenTinh: "Hue", fullDose: 11, oneDose: 11, plan: 100, rate: 1, vaccine: 1000,),

            ],
        ),
       ]
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}



