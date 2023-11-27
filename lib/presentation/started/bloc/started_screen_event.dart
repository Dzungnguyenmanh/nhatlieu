part of 'started_screen_bloc.dart';

@immutable
abstract class StartedScreenEvent extends Equatable {}

class StartedScreenInitEvent extends StartedScreenEvent {
  @override
  List<Object> get props => [];
}

class GoogleAuthenEvent extends StartedScreenEvent {
  GoogleAuthenEvent();

  @override
  List<Object?> get props => [];
}
