// ignore_for_file: must_be_immutable, unnecessary_this

part of 'started_screen_bloc.dart';

class StartedScreenState extends Equatable {
  StartedScreenState({this.startedModelobj});
  
  StartedModel? startedModelobj;
  @override
  List<Object?> get props => [startedModelobj];
  StartedScreenState copyWith({StartedModel? getStartedModelObj}){
    return StartedScreenState(startedModelobj:getStartedModelObj?? this.startedModelobj);
  }
}

