import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_covid_vn/HTTPSERVICE/world_sevices.dart';
import 'package:project_covid_vn/models/world_case.dart';

part 'world_case_state.dart';

class WorldCaseCubit extends Cubit<WorldCaseState> {
  WorldCaseCubit() : super(WorldCaseInitial());
  Future getWorldCaseFromService()async{
    try{
      final WorldCase worldCase=await WorldCaseService.getWorldCase();
      if(worldCase == null){
        emit(WorldCaseLoadedFailed("Loadding Error"));
      }
      else{
        emit(WorldCaseLoading());
        emit(WorldCaseLoaded(worldCase));
      }
    }on Exception catch (e){
      print(e);
    }
  }
}
