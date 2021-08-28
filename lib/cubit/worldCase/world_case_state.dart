part of 'world_case_cubit.dart';

class WorldCaseState {}

class WorldCaseInitial extends WorldCaseState {}
class WorldCaseLoading extends WorldCaseState {}
class WorldCaseLoaded extends WorldCaseState {
  WorldCase worldCase;
  WorldCaseLoaded(this.worldCase);
}
class WorldCaseLoadedFailed extends WorldCaseState {
  String message;
  WorldCaseLoadedFailed(this.message);
}
