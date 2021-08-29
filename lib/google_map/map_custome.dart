
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_covid_vn/cubit/vn_covid_case_province/vncovid_case_province_cubit.dart';
import 'package:project_covid_vn/cubit/vn_vaccine_distribution/vn_vaccine_distribution_cubit.dart';
import 'package:project_covid_vn/models/vn_case_province.dart';
import 'package:project_covid_vn/widgets/distributed_covid/distributed_case.dart';
import 'package:project_covid_vn/widgets/distributed_covid/rate_vaccine.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:http/http.dart' as http;
class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  late MapShapeSource _mapSource, _mapSource1;
  late List<Model> data=[];
  late List<Model1> dataRateVaccine=[];
  late List<VnCaseProvince> vnCaseProvince=[];
  @override
  void initState() {
    // TODO: implement initState
    context.read<VncovidCaseProvinceCubit>().getCaseProvince();
    context.read<VnVaccineDistributionCubit>().getVaccineDitributionVn();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = new ScrollController();
    var size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF473F97),
        centerTitle: true,
        title: Text("Distribution Covid 19 and Vaccine Rate", style: TextStyle(fontSize: 16, fontFamily: "FlutterIcons"),)
        ),
      body: ListView(
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
          // reverse: true,
          shrinkWrap: true,
         children:[
            Container(
              width: size.width,
              height: size.height,
              child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5,bottom: 5),
                        child: Text("Covid Cases", style: TextStyle(color: Colors.black, fontSize: 12, fontFamily: "Ubuntu",)),
                      ),
                      NumberCaseCovid(color: Color(0xFF660202),numberCase: ">100,000",),
                      NumberCaseCovid(color: Color(0XFFa30000),numberCase: ">10,000",),
                      NumberCaseCovid(color: Color(0xFFec5d61).withOpacity(0.9),numberCase: ">1,000",),
                      NumberCaseCovid(color: Color(0xFFed9798),numberCase: ">100",),
                      NumberCaseCovid(color: Color(0xFFefb3b3),numberCase: "1-100",),
                    ],
                  ),
                ),
                BlocBuilder<VncovidCaseProvinceCubit, VncovidCaseProvinceState>(
                builder: (context, state) {
                  if(state is VncovidCaseProvinceLoaded){
                    state.vnCaseProvince.forEach((element) {
                      // print(element.diaDiem);
                      if(element.tongCaNhiem>100000){
                        data.add(Model(element.diaDiem, Color(0xFF660202)));
                      }
                      else if(element.tongCaNhiem<100000 && element.tongCaNhiem>10000){
                        data.add(Model(element.diaDiem, Color(0XFFa30000)));
                      }
                      else if(element.tongCaNhiem<10000 && element.tongCaNhiem>1000){
                        data.add(Model(element.diaDiem, Color(0xFFec5d61).withOpacity(0.9)));
                      }
                      else if(element.tongCaNhiem<1000 && element.tongCaNhiem>100){
                        data.add(Model(element.diaDiem, Color(0xFFed9798)));
                      }
                      else if(element.tongCaNhiem<100 && element.tongCaNhiem>0){
                        data.add(Model(element.diaDiem, Color(0xFFefb3b3)));
                      }
                    });
                    _mapSource = MapShapeSource.asset(
                        'assets/vietnam1.json',
                        shapeDataField: 'name',
                        dataCount: data.length,
                        primaryValueMapper: (int index) => data[index].state,
                        shapeColorValueMapper: (int index) => data[index].color
                    );
                    return Expanded(
                        child: SfMaps(
                          layers: [
                            MapShapeLayer(
                              source: _mapSource,
                              // showDataLabels: true,
                            ),
                          ],
                        )
                    );
                  }
                  return Expanded(child: Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black))));
                  },
                ),
                Container(
                  width: 1,
                  height: size.height*0.7,
                  color: Colors.black,
                  )
                ],
              ),
            ),
            Container(
              width: size.width,
              height: size.height,
              child: Row(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Padding(
                   padding: const EdgeInsets.only(top: 5.0),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(left: 2,bottom: 5),
                         child: Text("Vaccine Rate", style: TextStyle(color: Colors.black, fontSize: 12, fontFamily: "Ubuntu",)),
                       ),
                       RateVaccine(color: Color(0xFF046300),numberCase: ">20%",),
                       RateVaccine(color: Color(0xFF08b500),numberCase: "10-20%",),
                       RateVaccine(color: Color(0XFF48ff40),numberCase: "0-10%",),

                       
                     ],
                   ),
                 ),
                 BlocBuilder<VnVaccineDistributionCubit, VnVaccineDistributionState>(
                   builder: (context, state) {
                     if(state is VnVaccineDistributionLoaded){
                       state.vaccineDistribution.dataDistribution.forEach((key, value) { 
                         if(value.distributedRate >= 20.0){
                           if(value.name=="Hồ Chí Minh")
                             {
                               value.name="TP. Hồ Chí Minh";
                             }
                           dataRateVaccine.add(Model1(value.name, Color(0xFF046300)));
                         }
                         else if(value.distributedRate >= 10.0 && value.distributedRate < 20.0){
                           if(value.name=="Hồ Chí Minh")
                           {
                             value.name="TP. Hồ Chí Minh";
                           }
                           dataRateVaccine.add(Model1(value.name, Color(0xFF08b500)));
                         }
                         else if(value.distributedRate > 0 && value.distributedRate<10){
                           if(value.name=="Hồ Chí Minh")
                           {
                             value.name="TP. Hồ Chí Minh";
                           }
                           dataRateVaccine.add(Model1(value.name, Color(0XFF48ff40)));
                         }
                       });
                       _mapSource1 = MapShapeSource.asset(
                           'assets/vietnam1.json',
                           shapeDataField: 'name',
                           dataCount: dataRateVaccine.length,
                           primaryValueMapper: (int index) => dataRateVaccine[index].state,
                           shapeColorValueMapper: (int index) => dataRateVaccine[index].color
                       );
                       return Expanded(
                           child: SfMaps(
                             layers: [
                               MapShapeLayer(
                                 source: _mapSource1,
                                 // showDataLabels: true,
                               ),
                             ],
                           )
                       );
                     }
                     return Expanded(child: Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black))));
                   },
                 ),
               ],
           ),
            ),
      ]
      ),
    );
  }
}

class Model {
  Model(this.state, this.color);
  String state;
  Color color;
}
class Model1 {
  Model1(this.state, this.color);
  String state;
  Color color;
}