import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_covid_vn/HTTPSERVICE/vn_covid_details_province_service.dart';
import 'package:project_covid_vn/models/vn_covid_details_province.dart';

part 'vn_covid_provice_detail_state.dart';

class VnCovidProviceDetailCubit extends Cubit<VnCovidProviceDetailState> {
  VnCovidProviceDetailCubit() : super(VnCovidProviceDetailInitial());
  Future getVnCovidProvince()async{
    try{
      final dataCovidProvince=await VnCovidDetailsProvinceService.getCovidProvinceDetails();
      if(dataCovidProvince == null) {
        emit(VnCovidProviceDetailLoadedFailed());
      }
      else{
        emit(VnCovidProviceDetailLoaded(dataCovidProvince));
      }
    }on Exception catch  (e){
      print(e);
    }
  }
}
