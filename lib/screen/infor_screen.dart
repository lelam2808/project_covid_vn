import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_covid_vn/HTTPSERVICE/vn_vaccine.dart';
import 'package:project_covid_vn/cubit/vn_covid_case_province/vncovid_case_province_cubit.dart';
import 'package:project_covid_vn/cubit/vn_vaccine_distribution/vn_vaccine_distribution_cubit.dart';
import 'package:project_covid_vn/google_map/map_custome.dart';
import 'package:project_covid_vn/polygion.dart';

class InforScreen extends StatefulWidget {
  const InforScreen({Key? key}) : super(key: key);

  @override
  _InforScreenState createState() => _InforScreenState();
}

class _InforScreenState extends State<InforScreen>  with AutomaticKeepAliveClientMixin<InforScreen>{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => VncovidCaseProvinceCubit()),
          BlocProvider(create: (context) => VnVaccineDistributionCubit()),
        ],

        child: MapSample(),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
