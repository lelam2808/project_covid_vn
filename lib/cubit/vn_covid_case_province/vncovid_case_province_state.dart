part of 'vncovid_case_province_cubit.dart';

 class VncovidCaseProvinceState {}

class VncovidCaseProvinceInitial extends VncovidCaseProvinceState {}
class VncovidCaseProvinceLoaded  extends VncovidCaseProvinceState {
  List<VnCaseProvince> vnCaseProvince;
  VncovidCaseProvinceLoaded(this.vnCaseProvince);
}
class VncovidCaseProvinceLoadedFailed extends VncovidCaseProvinceState {}

