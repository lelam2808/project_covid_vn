import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_covid_vn/cubit/vnCases/vn_case_cubit.dart';
import 'package:project_covid_vn/cubit/vn_covid_details_province/vn_covid_provice_detail_cubit.dart';
import 'package:project_covid_vn/cubit/vn_vaccine/vn_vaccine_cubit.dart';
import 'package:project_covid_vn/cubit/vn_vaccine_distribution/vn_vaccine_distribution_cubit.dart';
import 'package:project_covid_vn/cubit/worldCase/world_case_cubit.dart';
import 'package:project_covid_vn/screen/custom_screen.dart';
import 'package:project_covid_vn/screen/details_covid_screen.dart';
import 'package:project_covid_vn/screen/infor_screen.dart';
import 'package:project_covid_vn/screen/vaccine_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  static int _currentIndex=0;
  late final List<Widget> screen;
  @override
  void initState() {
    _pageController=PageController(initialPage: _currentIndex);
     screen=[
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>WorldCaseCubit()),
          BlocProvider(create: (context)=>VnCaseCubit())
        ],
        child: CustomeScreen(),
      ),
       BlocProvider(
         create: (context) => VnCovidProviceDetailCubit(),
         child: DetailCovidScreen(),
       ),
       MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => VnVaccineCubit()),
          BlocProvider(create: (context) => VnVaccineDistributionCubit()),
        ],
        child: VaccineScreen(),
      ),
       InforScreen(),
    ];
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
      super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          elevation: 0.0,
          currentIndex: _currentIndex,
          onTap: (index)=>setState(()=>{
            _currentIndex=index,
            _pageController.jumpToPage(index),
          }),
          backgroundColor: Colors.white,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: [Icons.home, CupertinoIcons.square_list_fill, CupertinoIcons.shield_fill, CupertinoIcons.location_solid]
              .asMap().map((key, value) => MapEntry(
              key, BottomNavigationBarItem(
                title: Text(""),
                icon: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    color: _currentIndex==key ? Color(0xFF473F97) : Colors.transparent
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Icon(value),
                  ),
                )
          ))).values.toList(),

        ),
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          // index: _currentIndex,
          children: screen
          ,
        ),
      ),
    );
  }
}
