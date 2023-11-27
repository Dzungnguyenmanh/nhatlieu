import 'dart:async';


import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nhatlieu/presentation/login/models/login_model.dart';

part 'login_screen_event.dart';
part 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  LoginScreenBloc(LoginScreenState initState) : super(initState) {
    on<LoginScreenInitEvent>(_onInitialState);
    on<CreateLoginEvent>(_callCreateLogin);
  }
  _onInitialState(
      LoginScreenInitEvent event, Emitter<LoginScreenState> emit) async {
    emit(state.copyWith(
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
        isShowPass: true));
  }
  FutureOr<void> _callCreateLogin(
    CreateLoginEvent event,
    Emitter<LoginScreenState> emit,
  ) async {
    
  }


}
