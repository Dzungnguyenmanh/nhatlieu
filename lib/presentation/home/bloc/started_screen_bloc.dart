import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nhatlieu/cores/utils/data_Reponse.dart';
import 'package:nhatlieu/data/repository/repository.dart';
import 'package:nhatlieu/presentation/home/models/account_model.dart';

part 'started_screen_event.dart';
part 'started_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeEvent, HomeState> {
  HomeScreenBloc(HomeState initState) : super(initState) {
    on<HomeInitEvent>(_onInitialState);
  }

  final _repository = Repository();
  var _dataresponse = DataResponse();

  _onInitialState(HomeInitEvent event, Emitter<HomeState> emit) async {
    await _repository.getAccounts(
        headers: {'Content-type': 'application/json'}).then((value) async {
      _dataresponse = value;
      __onSuccess(_dataresponse, emit);
    });
  }

  __onSuccess(DataResponse value, Emitter<HomeState> emit) {
    emit(state.copyWith(accounts: value.data));
  }
}
