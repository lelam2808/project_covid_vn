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
  List<DataDistribution> _result_Dis = [];
  List<DataDistribution> _result_Dis_Search = [];
  List<DataVacDose> _result_Vac = [];
  List<DataVacDose> _result_Vac_Search = [];
  @override
  void initState() {
    // TODO: implement initState
    context.read<VnVaccineCubit>().getVaccineVn();
    context.read<VnVaccineDistributionCubit>().getVaccineDitributionVn();
    VnVaccineDistribution.getVnVaccineDistribution().then((value){
      _result_Vac.addAll(value.dataVacDose.values);
      _result_Vac_Search=_result_Vac;
      _result_Dis.addAll(value.dataDistribution.values);
      _result_Dis_Search=_result_Dis;

    });
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
                      style: TextStyle(fontFamily: "FlutterIcons",fontSize: 16)),
                ]
            ),
          );
          },
      ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
        VaccineInfor(size: size,),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: size.width*0.01),
          child: Container(
              width: size.width*0.98,
              height: size.height*0.07,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20)
              ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Container(
                      width: size.width*0.6,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: TextField(
                          onChanged:(text){
                            text=text.toLowerCase();
                            setState(() {
                              _result_Vac_Search=_result_Vac.where((element){
                                var title=element.name.toLowerCase();
                                return title.contains(text);
                              }).toList();
                              _result_Dis_Search=_result_Dis.where((element){
                                var title=element.name.toLowerCase();
                                return title.contains(text);
                              }).toList();
                              print(_result_Vac_Search);
                            });
                          },
                        decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                          hintText: "Search Province !",
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                        ),
                      ),
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      // onTap: onSearchTextChanged(""),
                      child: Container(
                          width: 30,
                          height: 30,
                          child: Icon(Icons.search, color: Colors.grey,)
                      ),
                    ),
                  )
                ]
            )
          ),
        ),
          Expanded(
            child: BlocBuilder<VnVaccineDistributionCubit, VnVaccineDistributionState>(
            builder: (context, state) {
              if(state is VnVaccineDistributionLoaded) {
                var formatter = NumberFormat('#,###,000');
                return _result_Vac_Search.length == 0 ? ListView.builder(
                    itemCount: state.vaccineDistribution.dataVacDose.length,
                    itemBuilder: (context,index) {
                      final plan=state.vaccineDistribution.dataDistribution["$index"]!.planned;
                      final fulldose=state.vaccineDistribution.dataVacDose["$index"]!.fulldose;
                      final onedose=state.vaccineDistribution.dataVacDose["$index"]!.onedose;
                      return DetailVaccine(
                        plan: formatter.format(plan),
                        tenTinh: state.vaccineDistribution.dataDistribution["$index"]!.name ,
                        rate: state.vaccineDistribution.dataDistribution["$index"]!.distributedRate.toDouble(),
                        fullDose: formatter.format(fulldose),
                        oneDose:  formatter.format(onedose),
                      );
                    })
                    : new ListView.builder(
                        itemCount: _result_Vac_Search.length,
                        itemBuilder: (context, index){
                          final fulldose=_result_Vac_Search[index].fulldose;
                          final onedose=_result_Vac_Search[index].onedose;
                          final plan=_result_Dis_Search[index].planned;
                          return DetailVaccine(
                            plan:plan.toString(),
                            tenTinh: _result_Vac_Search[index].name,
                            rate: _result_Dis_Search[index].distributedRate,
                            fullDose: formatter.format(fulldose),
                            oneDose:  formatter.format(onedose),
                          );
                        }
                    );
                }
                return Scaffold();
              },
            ),
          ),
        ],
        ),
    );

  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}



