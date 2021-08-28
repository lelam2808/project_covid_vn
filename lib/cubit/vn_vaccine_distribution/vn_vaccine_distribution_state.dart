part of 'vn_vaccine_distribution_cubit.dart';

class VnVaccineDistributionState {}

class VnVaccineDistributionInitial extends VnVaccineDistributionState {}
class VnVaccineDistributionLoaded extends VnVaccineDistributionState {
  VaccineDistribution vaccineDistribution;

  VnVaccineDistributionLoaded(this.vaccineDistribution);
}
class VnVaccineDistributionLoadedFailed extends VnVaccineDistributionState {}

