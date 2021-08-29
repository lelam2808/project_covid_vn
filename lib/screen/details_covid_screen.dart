import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:project_covid_vn/cubit/vn_covid_details_province/vn_covid_provice_detail_cubit.dart';
import 'package:project_covid_vn/widgets/detail_item.dart';
import 'package:project_covid_vn/widgets/test.dart';
class DetailCovidScreen extends StatefulWidget {
  const DetailCovidScreen({Key? key}) : super(key: key);

  @override
  _DetailCovidScreenState createState() => _DetailCovidScreenState();
}

class _DetailCovidScreenState extends State<DetailCovidScreen> with AutomaticKeepAliveClientMixin<DetailCovidScreen> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<VnCovidProviceDetailCubit>().getVnCovidProvince();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd  kk:mm:ss').format(now);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor:  Color(0xFF473F97),
          centerTitle: true,
          title:  RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                children: [
                  TextSpan(text: "Details Distribution In VietNam\n", style: TextStyle(fontFamily: "FlutterIcons", fontSize: 16)),
                  TextSpan(text: "Last Update $formattedDate ", style: TextStyle(fontFamily: "FlutterIcons", fontSize: 12))
                ]
            ),
          ),
        ),
      ) ,
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: size.width*0.9,
                height: size.height*0.07,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: size.width*0.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextField(
                          decoration: InputDecoration(
                            hintStyle: TextStyle(fontSize: 18, color: Colors.grey),
                            hintText: "Seach Here !!",
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        width: 30,
                          height: 30,
                          child: Icon(Icons.search, color: Colors.grey,)
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<VnCovidProviceDetailCubit, VnCovidProviceDetailState>(
              builder: (context, state) {
                if(state is VnCovidProviceDetailLoaded){
                  // print(state.listDetails.length);
                  return ListView.builder(
                    itemCount: state.listDetails.length,
                      itemBuilder: (context, index){
                      var homNay, tuVong,tongCaNhiem;
                      var formatter = NumberFormat('#,###,000');
                      if(state.listDetails[index].homNay>1000){
                      homNay =formatter.format(state.listDetails[index].homNay).toString();
                      }else{
                        homNay=state.listDetails[index].homNay;
                      }
                      if(state.listDetails[index].tuVong>1000){
                        tuVong =formatter.format(state.listDetails[index].tuVong).toString();
                      }else{
                        tuVong=state.listDetails[index].tuVong;
                      }
                      if(state.listDetails[index].tongCaNhiem>1000){
                        tongCaNhiem =formatter.format(state.listDetails[index].tongCaNhiem).toString();
                      }else{
                        tongCaNhiem=state.listDetails[index].tongCaNhiem;
                      }
                        return DetailItem(
                          tp: state.listDetails[index].diaDiem,
                          hn: homNay.toString(),
                          tcn:tongCaNhiem.toString(),
                          tv: tuVong.toString()
                        );
                      });
                }
                return Scaffold();
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
