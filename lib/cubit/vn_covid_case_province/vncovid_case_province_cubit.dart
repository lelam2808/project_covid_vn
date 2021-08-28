import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_covid_vn/HTTPSERVICE/vn_covid_distribution_service.dart';
import 'package:project_covid_vn/models/vn_case_province.dart';

part 'vncovid_case_province_state.dart';

class VncovidCaseProvinceCubit extends Cubit<VncovidCaseProvinceState> {
  VncovidCaseProvinceCubit() : super(VncovidCaseProvinceInitial());
  Future getCaseProvince()async{
    try{
      final dataCovidProvince=await VnCaseProvinceService.getVnCovidProvince();
      if(dataCovidProvince == null) {
        emit(VncovidCaseProvinceLoadedFailed());
      }
      else{
        emit(VncovidCaseProvinceLoaded(dataCovidProvince));
      }
    }on Exception catch  (e){
      print(e);
    }
  }
}
