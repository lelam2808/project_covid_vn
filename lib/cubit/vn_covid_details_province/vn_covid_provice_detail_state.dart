part of 'vn_covid_provice_detail_cubit.dart';

@immutable
abstract class VnCovidProviceDetailState {}

class VnCovidProviceDetailInitial extends VnCovidProviceDetailState {}
class VnCovidProviceDetailLoaded extends VnCovidProviceDetailState {
  List<DetailsCovidInEachProvince> listDetails;

  VnCovidProviceDetailLoaded(this.listDetails);
}
class VnCovidProviceDetailLoadedFailed extends VnCovidProviceDetailState {}
