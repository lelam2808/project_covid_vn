import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:project_covid_vn/HTTPSERVICE/vn_covid_distribution_service.dart';
import 'package:project_covid_vn/cubit/vn_covid_case_province/vncovid_case_province_cubit.dart';
import 'package:project_covid_vn/models/vn_case_province.dart';
import 'package:project_covid_vn/widgets/distributed_covid/distributed_case.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:http/http.dart' as http;
class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  late MapShapeSource _mapSource;
  late List<Model> data=[];
  late List<VnCaseProvince> vnCaseProvince=[];
  @override
  void initState() {
    // TODO: implement initState
    context.read<VncovidCaseProvinceCubit>().getCaseProvince();
    super.initState();
  }
  // @override
  // void initState() {
  //   VnCaseProvinceService.getVnCovidProvince().then((value) =>
  //     value.forEach((element) {
  //       print(element.diaDiem);
  //       // vnCaseProvince.add(element);
  //       data.add(Model(element.diaDiem, Colors.red));
  //       print(data.length);

  //   }));
  //   // print(vnCaseProvince.length);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF473F97),
        centerTitle: true,
        title: Text("Covid Distributed in VietNam", style: TextStyle(fontSize: 16, fontFamily: "FlutterIcons"),)
        ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
        ],
      ),
    );
  }
}

class Model {
  Model(this.state, this.color);
  String state;
  Color color;
}