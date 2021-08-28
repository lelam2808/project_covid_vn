import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_covid_vn/HTTPSERVICE/vn_vaccine.dart';
import 'package:project_covid_vn/models/vn_vaccine.dart';

part 'vn_vaccine_state.dart';

class VnVaccineCubit extends Cubit<VnVaccineState> {
  VnVaccineCubit() : super(VnVaccineInitial());
  Future getVaccineVn()async{
    try{
      final dataVaccine=await VnVaccine.getVnVaccine();
        if(dataVaccine == null) {
          emit(VnVaccineLoadedFailed("error"));
        }
        else{
          emit(VnVaccineLoaded(dataVaccine));
        }
    }on Exception catch  (e){
      print(e);
    }
  }
}
