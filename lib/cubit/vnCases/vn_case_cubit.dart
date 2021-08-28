import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_covid_vn/HTTPSERVICE/vn_sevices.dart';
import 'package:project_covid_vn/models/vn_case.dart';

part 'vn_case_state.dart';

class VnCaseCubit extends Cubit<VnCaseState> {
  VnCaseCubit() : super(VnCaseInitial());
  Future getCaseFromVn()async{
    try{
      final  vnCase=await VnCaseService.getVNCase();
      if(vnCase==null){
        emit(VnCaseLoadedFailed("Loadding Error"));
      }
      else{
        emit(VnCaseLoading());
        emit(VnCaseLoaded(vnCase));
      }
    }on Exception catch (e){
      print(e);
    }
  }
}
