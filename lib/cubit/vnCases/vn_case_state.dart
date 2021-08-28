part of 'vn_case_cubit.dart';
class VnCaseState {}

class VnCaseInitial extends VnCaseState {}
class VnCaseLoading extends VnCaseState {}
class VnCaseLoaded extends VnCaseState {
  VnCase vnCase;
  VnCaseLoaded(this.vnCase);
}
class VnCaseLoadedFailed extends VnCaseState {
  String message;

  VnCaseLoadedFailed(this.message);
}


