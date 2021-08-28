import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_covid_vn/cubit/vnCases/vn_case_cubit.dart';
import 'package:project_covid_vn/cubit/worldCase/world_case_cubit.dart';
import 'package:project_covid_vn/widgets/bellow_appbar.dart';
import 'package:project_covid_vn/widgets/case_vietnam.dart';
import 'package:project_covid_vn/widgets/case_world.dart';

class CustomeScreen extends StatefulWidget {
  const CustomeScreen({Key? key}) : super(key: key);

  @override
  _CustomeScreenState createState() => _CustomeScreenState();
}

class _CustomeScreenState extends State<CustomeScreen> with AutomaticKeepAliveClientMixin<CustomeScreen>{
  @override
  Widget build(BuildContext context) {
    // super.build(context);
    var size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            elevation: 0.0,
            backgroundColor: Color(0xFF473F97),
            centerTitle: true,
            title: Text("COVID-19",style: TextStyle(fontFamily: "FlutterIcons"),),
            leading: Icon(Icons.menu, color: Colors.white,),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: GestureDetector(child: Icon(CupertinoIcons.bell_fill)),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: BelowAppBar(size: size),
          ),
          SliverToBoxAdapter(
              child: CaseWorld()
          ),
          SliverToBoxAdapter(
              child: CaseVietNam()
          ),
          SliverToBoxAdapter(
              child: SizedBox(height: 10,)
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

