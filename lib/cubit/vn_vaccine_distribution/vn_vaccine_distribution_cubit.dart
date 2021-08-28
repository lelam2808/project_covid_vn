import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_covid_vn/HTTPSERVICE/vn_vaccine_distribution_service.dart';
import 'package:project_covid_vn/models/vn_vaccine_distribution.dart';

part 'vn_vaccine_distribution_state.dart';

class VnVaccineDistributionCubit extends Cubit<VnVaccineDistributionState> {
  VnVaccineDistributionCubit() : super(VnVaccineDistributionInitial());
  Future getVaccineDitributionVn()async{
    try{
      final dataVaccine=await VnVaccineDistribution.getVnVaccineDistribution();
      // final x=dataVaccine.portfolio;
      //
      // print(x);
      if(dataVaccine == null) {
        emit(VnVaccineDistributionLoadedFailed());
      }
      else{
        emit(VnVaccineDistributionLoaded(dataVaccine));
      }
    }on Exception catch  (e){
      print(e);
    }
  }
}
