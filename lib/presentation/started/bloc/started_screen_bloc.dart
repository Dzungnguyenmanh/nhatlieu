import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nhatlieu/presentation/started/models/started_model.dart';

part 'started_screen_event.dart';
part 'started_screen_state.dart';

class StartedScreenBloc extends Bloc<StartedScreenEvent, StartedScreenState> {
  StartedScreenBloc(StartedScreenState initState) : super(initState) {
    on<StartedScreenInitEvent>(_onInitialState);
  }
  _onInitialState(StartedScreenInitEvent event,Emitter<StartedScreenState> emit)async{

  }
}
