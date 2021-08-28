part of 'vn_vaccine_cubit.dart';

@immutable
abstract class VnVaccineState {}

class VnVaccineInitial extends VnVaccineState {}
class VnVaccineLoaded extends VnVaccineState {
  Data data;
  VnVaccineLoaded(this.data);
}
class VnVaccineLoadedFailed extends VnVaccineState {
  String message;
  VnVaccineLoadedFailed(this.message);
}

